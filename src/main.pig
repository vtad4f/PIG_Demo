
REGISTER 'udf.py' using jython as myudf

all_data        = LOAD '/home/maria_dev/PIG_Demo/test/movies.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',', 'YES_MULTILINE') AS (MovieID: chararray, UserID: chararray, UserName: chararray,  Helpful: chararray, Score: chararray, Time: chararray, Summary: chararray, Text: chararray);

summary_word_ct = FOREACH all_data GENERATE myudf.WordCount(Summary)
text_word_ct    = FOREACH all_data GENERATE myudf.WordCount(Text)

dump summary_word_ct
dump text_word_ct

