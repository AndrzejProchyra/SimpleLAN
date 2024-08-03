"
A LNPrinterTest is a test class for testing the behavior of LNPrinter
"
Class {
	#name : 'LNPrinterTest',
	#superclass : 'TestCase',
	#category : 'SimpleLAN-Tests',
	#package : 'SimpleLAN-Tests'
}

{ #category : 'tests' }
LNPrinterTest >> testPrint [

	| mockLogStream lnPrinter packet |
	mockLogStream := WriteStream on: (String new: 1000).
	lnPrinter := LNPrinter new logStream: mockLogStream.
	packet := LNPacket new
		          originatorName: '[Originator Node Name]';
		          content: '[Packet Contents]'.

	lnPrinter print: packet.

	self
		assert: mockLogStream contents
		equals:
			'Node [Originator Node Name] sent to printer: [Packet Contents]'
			, Character cr asString
]
