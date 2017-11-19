register '/home/training/workspace/PIG_UDF/lib/PIG_UDF.jar';

Lines = LOAD '/home/training/workspace/PIG_UDF/input.txt' Using PigStorage('\t') AS (word: chararray, chapterCounter: int);

AllWords = foreach Lines generate chapterCounter, flatten(TOKENIZE(word)) as word;

FilteredWords = FILTER AllWords BY (LOWER(word) != 'in') AND (LOWER(word) != 'and') AND (LOWER(word) != 'a');

WordsChapGroup = Group FilteredWords By (word, chapterCounter);

WordsChap = Foreach WordsChapGroup Generate FLATTEN(group) As (word,  chapterCounter), COUNT(FilteredWords.chapterCounter) as occurrenceCount;

WordsGroup = Group WordsChap By (word);

Words = Foreach WordsGroup Generate FLATTEN(group) As (word), COUNT(WordsChap.chapterCounter) As chapterSum, SUM(WordsChap.occurrenceCount) As occurrenceSum;

WordsFull = FOREACH Words GENERATE *, (long)4 AS chapterTotal;

AllChapWords = FOREACH WordsFull Generate FLATTEN(CompTwoCol(chapterSum,chapterTotal)) As isCommon, word, occurrenceSum;

CommonChapWords = Filter AllChapWords By ((boolean)isCommon == TRUE);

OrderedWords = Order CommonChapWords By occurrenceSum Desc;

LimitedWords = Limit OrderedWords 5;

STORE LimitedWords INTO '/home/training/workspace/PIG_UDF/out'; 
