Class {
	#name : 'LNPacketTest',
	#superclass : 'TestCase',
	#category : 'SimpleLAN-Tests',
	#package : 'SimpleLAN-Tests'
}

{ #category : 'tests' }
LNPacketTest >> testInitialized [

	| p |
	p := LNPacket new.
	self assert: p addresseeName equals: '/'.
	self assert: p originatorName equals: '/'.
	self assert: p contents equals: ''
]

{ #category : 'tests' }
LNPacketTest >> testIsAddressedTo [

	^ (LNPacket new addresseeName: 'Mac') isAddressedTo:
		  (LNLinkNode new name: 'Mac')
]

{ #category : 'tests' }
LNPacketTest >> testPrintString [

	self
		assert: (LNPacket new
				 addresseeName: 'Mac';
				 contents: 'Pharo is cool';
				 yourself) printString
		equals: 'a LNPacket: Pharo is cool sentTo: Mac'
]
