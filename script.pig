AllLines = LOAD '/home/cloudera/Downloads/PIG_Demo-master/input.txt' Using PigStorage('\t') AS (line: chararray, chapterCounter: int);

AllWords = foreach AllLines generate flatten(TOKENIZE(line)) as word, chapterCounter;

FilteredWords = FILTER AllWords BY (LOWER(word) != 'ex1') AND (LOWER(word) != 'ex2') AND (word != 'Ex3');

WordsChapGroup = Group FilteredWords By (word, chapterCounter);

WordsChap = Foreach WordsChapGroup Generate FLATTEN(group) As (word,  chapterCounter), COUNT(FilteredWords.chapterCounter) as occurrenceChap;

WordsGroup = Group WordsChap By (word);

WordsFinal = Foreach WordsGroup Generate FLATTEN(group) As (word), COUNT(WordsChap.chapterCounter) As chapterTotal, SUM(WordsChap.occurrenceChap) As occurrenceTotal;

CommonChapWords = Filter WordsFinal By (chapterTotal == 3L);

OrderedWords = Order CommonChapWords By occurrenceTotal Desc;

LimitedWords = Limit OrderedWords 3;

Dump LimitedWords;

STORE LimitedWords INTO '/home/cloudera/Downloads/PIG_Demo-master/output';
