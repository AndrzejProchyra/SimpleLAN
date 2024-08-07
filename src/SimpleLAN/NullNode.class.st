Class {
	#name : 'NullNode',
	#superclass : 'Object',
	#category : 'SimpleLAN',
	#package : 'SimpleLAN'
}

{ #category : 'visiting' }
NullNode >> accept: aLNPacket [

	
]

{ #category : 'testing' }
NullNode >> isNull [

	^ true
]

{ #category : 'accessing' }
NullNode >> name [

	^ '/'
]
