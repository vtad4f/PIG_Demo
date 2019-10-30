

REGISTER 'udf.py' using jython as myudf;
all_data = LOAD '../test/movies.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',', 'YES_MULTILINE') AS (MovieID: chararray, UserID: chararray, UserName: chararray,  Helpful: chararray, Score: double, Time: chararray, Summary: chararray, Text: chararray);

/* Analytics */
summary_word_ct = FOREACH all_data GENERATE myudf.WordCount(Summary);
limited_summary_word_ct = LIMIT summary_word_ct 10;
dump limited_summary_word_ct;

text_word_ct = FOREACH all_data GENERATE myudf.WordCount(Text);
limited_text_word_ct = LIMIT text_word_ct 10;
dump limited_text_word_ct;

/* Aggregate */
group_by_helpful = GROUP all_data BY Helpful;
aggregate_helpful = FOREACH group_by_helpful GENERATE group, myudf.Ratio(group) AS (Ratio: double), myudf.Denominator(group) AS (Den: long), COUNT(all_data);
ordered_helpful = ORDER aggregate_helpful BY Ratio DESC, Den DESC;
limited_helpful = LIMIT ordered_helpful 10;
dump limited_helpful;

group_by_score = GROUP all_data BY Score;
aggregate_score = FOREACH group_by_score GENERATE group, COUNT(all_data);
ordered_score = ORDER aggregate_score BY group DESC;
limited_score = LIMIT ordered_score 10;
dump limited_score;

