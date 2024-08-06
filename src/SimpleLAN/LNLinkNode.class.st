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
		ifFalse: [ self send: aPacket ]
]

{ #category : 'testing' }
LNLinkNode >> hasNextNode [
	
	^ nextNode isNotNil
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
	nextNode
		ifNil: [ aStream nextPutAll: '/' ]
		ifNotNil: [ aStream nextPutAll: nextNode name ]
]

{ #category : 'instructions' }
LNLinkNode >> send: aPacket [

	nextNode ifNotNil: [
		(logStream << name << ' sends a packet to: ')
			<< nextNode name;
			cr;
			flush.
		nextNode accept: aPacket ]
]

{ #category : 'testing' }
LNLinkNode >> treatPacket: aPacket [

	^ self subclassResponsibility
]
