Class {
	#name : 'LNLinkNodeTest',
	#superclass : 'TestCase',
	#category : 'SimpleLAN-Tests',
	#package : 'SimpleLAN-Tests'
}

{ #category : 'tests' }
LNLinkNodeTest >> testAddOriginatorNameOnSend [

	| packet node1 node2 |
	node1 := LNLinkNode new name: 'Node 1'.
	node2 := LNLinkNode new name: 'Node 2'.
	node1 nextNode: node2.
	packet := LNPacket new
		          contents: 'any contents';
		          addresseeName: 'any addressee'.

	node1 send: packet.

	self assert: packet originatorName equals: 'Node 1'
]

{ #category : 'tests' }
LNLinkNodeTest >> testDoNotSendPacketIfSelfIsOriginator [

	| node1 node2 packet |
	packet := LNPacket new originatorName: 'Node 1'.
	node1 := LNLinkNode new name: 'Node 1'.
	node2 := MockNode new.
	node1 nextNode: node2.

	node1 send: packet.

	self assert: node2 callsToAccept equals: 0
]

{ #category : 'tests' }
LNLinkNodeTest >> testHasNextNode [

	self deny: LNLinkNode new hasNextNode
]

{ #category : 'tests' }
LNLinkNodeTest >> testPrintingJustInitializedNode [

	self assert: LNLinkNode new printString equals: 'unamed -> /'
]

{ #category : 'tests' }
LNLinkNodeTest >> testPrintingWithANextNode [

	self
		assert: (LNLinkNode new
				 name: #LNLinkNode1;
				 nextNode: (LNLinkNode new name: #PC1)) printString
		equals: 'LNLinkNode1 -> PC1'
]

{ #category : 'tests' }
LNLinkNodeTest >> testPrintingWithoutNextNode [

	self
		assert: (LNLinkNode new
				 name: #LNNode1;
				 printString)
		equals: 'LNNode1 -> /'
]

{ #category : 'tests' }
LNLinkNodeTest >> testSendLog [

	| mockLogStream node1 node2 |
	mockLogStream := WriteStream on: (String new: 1000).
	node1 := LNLinkNode new name: 'Node 1'.
	node2 := LNLinkNode new name: 'Node 2'.
	node1 nextNode: node2.
	node1 logStream: mockLogStream.

	node1 send: LNPacket new.

	self
		assert: mockLogStream contents
		equals: 'Node 1 sends a packet to: Node 2' , Character cr asString
]
