Class {
	#name : 'LNThrottlingNode',
	#superclass : 'LNLinkNode',
	#instVars : [
		'limit',
		'packetBuffer'
	],
	#category : 'SimpleLAN',
	#package : 'SimpleLAN'
}

{ #category : 'accessing' }
LNThrottlingNode class >> limit: anInteger [

	^ self new setLimit: anInteger
]

{ #category : 'testing' }
LNThrottlingNode >> accept: aPacket [

	packetBuffer add: aPacket.
	packetBuffer size = limit ifTrue: [
		packetBuffer size timesRepeat: [
			self
				logPacketSend;
				send: packetBuffer removeFirst ] ]
]

{ #category : 'initialization' }
LNThrottlingNode >> initialize [

	super initialize.
	packetBuffer := OrderedCollection new.
	nextNode := NullNode new
]

{ #category : 'initialization' }
LNThrottlingNode >> setLimit: anInteger [

	limit := anInteger
]
