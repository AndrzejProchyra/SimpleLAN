Class {
	#name : 'LNLinkNode',
	#superclass : 'LNNode',
	#instVars : [
		'name',
		'nextNode',
		'logStream'
	],
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

{ #category : 'initialization' }
LNLinkNode >> initialize [

	super initialize.
	logStream := Transcript.
	name := 'unamed'
]

{ #category : 'accessing' }
LNLinkNode >> logStream: aStream [

	logStream := aStream
]

{ #category : 'accessing' }
LNLinkNode >> name [

	^ name
]

{ #category : 'accessing' }
LNLinkNode >> name: aString [

	name := aString
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

{ #category : 'testing' }
LNLinkNode >> send: aPacket [

	nextNode ifNotNil: [
		(logStream << name << ' sends a packet to: ')
			<< nextNode name;
			cr;
			flush.
		nextNode accept: aPacket ]
]

{ #category : 'as yet unclassified' }
LNLinkNode >> treatPacket: aPacket [

	^ self subclassResponsibility
]
