
1. If you want the big input file, run 'mkdir in' and 'mkdir out'
2. Run './setup.sh' (which will only copy the big file if the 'in' dir exists)
3. cd into src, then run 'python main.py' (to create csv files used by pig)
4. cd back, then run 'source aliases.sh'

Now, at this point you have 3 aliases at your disposal
* reload (updates the repo's contents)
* test (runs the pig script against the first 500 lines of the input)
* run (runs the pig script against the entire input file)

