Class {
	#name : 'LNPrinter',
	#superclass : 'LNLinkNode',
	#category : 'SimpleLAN',
	#package : 'SimpleLAN'
}

{ #category : 'examples' }
LNPrinter class >> example [

	<script>
	(LNWorkstation new
		 name: 'Mac';
		 nextNode: (LNLinkNode new
				  name: 'PC1';
				  nextNode: (LNWorkstation new
						   name: 'Mac2';
						   nextNode: (LNPrinter new
								    name: 'Printer1';
								    yourself);
						   yourself))) emit: (LNPacket new
			 addresseeName: 'Printer1';
			 contents: 'Pharo is cool';
			 yourself)
]

{ #category : 'testing' }
LNPrinter >> print: aPacket [

	(logStream << 'Node ' << aPacket originatorName
	 << ' sent to printer: ')
		<< aPacket contents;
		cr;
		flush
]

{ #category : 'testing' }
LNPrinter >> treatPacket: aPacket [

	self print: aPacket
]
