Class {
	#name : 'LNStarNodeTest',
	#superclass : 'TestCase',
	#category : 'SimpleLAN-Tests',
	#package : 'SimpleLAN-Tests'
}

{ #category : 'tests' }
LNStarNodeTest >> testDefaultName [

	self assert: LNStarNode new name equals: 'hub'
]

{ #category : 'tests' }
LNStarNodeTest >> testSend [

	| packet node1 node2 node3 starNode |
	packet := LNPacket new.
	node1 := MockObject new
		         on: #name respond: 'Node 1';
		         on: #accept: with: packet.
	node2 := MockObject new
		         on: #name respond: 'Node 2';
		         on: #accept: with: packet.
	node3 := MockObject new
		         on: #name respond: 'Node 3';
		         on: #accept: with: packet.
	starNode := LNStarNode withConnectedNodes: {
			            node1.
			            node2.
			            node3 }.

	starNode send: packet.

	self verify: node1.
	self verify: node2.
	self verify: node3
]
