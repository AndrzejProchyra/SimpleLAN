Class {
	#name : 'LNLinkNode',
	#superclass : 'LNNode',
	#category : 'SimpleLAN',
	#package : 'SimpleLAN'
}

{ #category : 'examples' }
LNLinkNode class >> example1 [

	<script>
	(LNLinkNode new
    name: 'Mac' ;
    nextNode: (LNLinkNode new name: 'PC1'))  accept: (LNPacket new addresseeName: 'Mac')
]

{ #category : 'testing' }
LNLinkNode >> accept: aPacket [

	(aPacket isAddressedTo: self)
		ifTrue: [ self treatPacket: aPacket ]
		ifFalse: [
			self logPacketSend.
			self send: aPacket ]
]

{ #category : 'testing' }
LNLinkNode >> hasNextNode [

	^ nextNode isNull not
]

{ #category : 'initialization' }
LNLinkNode >> initialize [

	super initialize.
	nextNode := NullNode new
]

{ #category : 'instructions' }
LNLinkNode >> logPacketSend [

	(logStream << name << ' sends a packet to: ')
		<< nextNode name asString;
		cr;
		flush
]

{ #category : 'accessing' }
LNLinkNode >> nextNode [

	^ nextNode
]

{ #category : 'accessing' }
LNLinkNode >> nextNode: aLNNode [

	nextNode := aLNNode
]

{ #category : 'printing' }
LNLinkNode >> printOn: aStream [

	aStream nextPutAll: name.
	aStream nextPutAll: ' -> '.
	aStream nextPutAll: nextNode name
]

{ #category : 'instructions' }
LNLinkNode >> send: aPacket [

	name = aPacket originatorName ifFalse: [ nextNode accept: aPacket ]
]

{ #category : 'testing' }
LNLinkNode >> treatPacket: aPacket [

	"do nothing"
]
