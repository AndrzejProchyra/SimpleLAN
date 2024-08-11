Class {
	#name : 'LNThrottlingNodeTest',
	#superclass : 'TestCase',
	#category : 'SimpleLAN-Tests',
	#package : 'SimpleLAN-Tests'
}

{ #category : 'tests' }
LNThrottlingNodeTest >> testSendsPacketsInReceivedOrder [

	| throttlingNode mockNextNode packet1 packet2 packet3 |
	mockNextNode := MockObject new.
	throttlingNode := LNThrottlingNode limit: 3.
	throttlingNode nextNode: mockNextNode.
	packet1 := LNPacket new content: 'one'.
	packet2 := LNPacket new content: 'two'.
	packet3 := LNPacket new content: 'three'.
	mockNextNode on: #name respond: 'next node'.
	mockNextNode on: #accept: with: packet1.
	mockNextNode on: #name respond: 'next node'.
	mockNextNode on: #accept: with: packet2.
	mockNextNode on: #name respond: 'next node'.
	mockNextNode on: #accept: with: packet3.

	throttlingNode accept: packet1.
	throttlingNode accept: packet2.
	throttlingNode accept: packet3.

	self verify: mockNextNode
]

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
