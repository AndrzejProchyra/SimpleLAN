Class {
	#name : 'LNWorkstationTest',
	#superclass : 'TestCase',
	#category : 'SimpleLAN-Tests',
	#package : 'SimpleLAN-Tests'
}

{ #category : 'tests' }
LNWorkstationTest >> testAddOriginatorNameOnEmit [

	| packet workstation node |
	workstation := LNWorkstation new name: 'Workstation'.
	node := LNLinkNode new name: 'Node'.
	workstation nextNode: node.
	packet := LNPacket new
		          contents: 'any contents';
		          addresseeName: 'any addressee'.

	workstation emit: packet.

	self assert: packet originatorName equals: 'Workstation'
]
