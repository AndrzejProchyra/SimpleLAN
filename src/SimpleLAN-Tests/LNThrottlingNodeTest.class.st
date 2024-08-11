Class {
	#name : 'LNThrottlingNodeTest',
	#superclass : 'TestCase',
	#category : 'SimpleLAN-Tests',
	#package : 'SimpleLAN-Tests'
}

{ #category : 'tests' }
LNThrottlingNodeTest >> testSendsPacketsWhenLimitIsReached [

	| throttlingNode mockNextNode |
	mockNextNode := MockNode new.
	throttlingNode := LNThrottlingNode limit: 3.
	throttlingNode nextNode: mockNextNode.

	throttlingNode accept: LNPacket new.
	self assert: mockNextNode callsToAccept equals: 0.

	throttlingNode accept: LNPacket new.
	self assert: mockNextNode callsToAccept equals: 0.

	throttlingNode accept: LNPacket new.
	self assert: mockNextNode callsToAccept equals: 3
]
