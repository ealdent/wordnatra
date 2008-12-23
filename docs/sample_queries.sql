select 
sense.wordid,
wordposition.positionid,
word.lemma,
sentenceref.sentenceid,
sentencedef.sentence,
frameref.frameid,
framedef.frame,
morphref.morphid,
morphdef.lemma as morphdef_lemma,
casedword.lemma as casedword_lemma
from
sense
inner join word on sense.wordid = word.wordid
inner join wordposition on sense.wordid = wordposition.wordid and sense.synsetid = wordposition.synsetid
inner join synset on sense.synsetid = synset.synsetid
left outer join casedword on sense.wordid = casedword.wordid
left outer join sentenceref on sense.synsetid = sentenceref.synsetid and sense.wordid = sentenceref.wordid
left outer join sentencedef on sentenceref.sentenceid = sentencedef.sentenceid
left outer join frameref on sense.synsetid = frameref.synsetid and sense.wordid = frameref.wordid
left outer join framedef on frameref.frameid = framedef.frame 
left outer join morphref on word.wordid = morphref.wordid
left outer join morphdef on morphref.morphid = morphdef.morphid
left outer join synset on sense.synsetid = sy

where morphdef.lemma is not null


;