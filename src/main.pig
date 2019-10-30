

REGISTER 'udf.py' using jython as myudf;
all_data = LOAD '../test/movies.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',', 'YES_MULTILINE') AS (MovieID: chararray, UserID: chararray, UserName: chararray,  Helpful: chararray, Score: chararray, Time: chararray, Summary: chararray, Text: chararray);

/* Analytics */
summary_word_ct = FOREACH all_data GENERATE myudf.WordCount(Summary);
limited_summary_word_ct = LIMIT summary_word_ct 10;
dump limited_summary_word_ct;

text_word_ct = FOREACH all_data GENERATE myudf.WordCount(Text);
limited_text_word_ct = LIMIT text_word_ct 10;
dump limited_text_word_ct;

/* Aggregate */
group_by_helpful = GROUP all_data BY Helpful;
aggregate = FOREACH group_by_helpful GENERATE group, COUNT(all_data);
ordered = ORDER aggregate DESC;
limited_ordered = LIMIT ordered 10;
dump limited_ordered;
