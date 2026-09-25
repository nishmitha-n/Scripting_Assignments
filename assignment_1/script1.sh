1. Using sim.log, print the line numbers of all ERROR messages.
grep -n "ERROR" sim.log
// 4,7 was the output

2. Count the number of warnings in sim.log
grep -i -c "warning" sim.log
# if warning then 2 was the output

3. Case-insensitively search for the word setup violation in timing_report.rpt.
grep -i -c "set violation" timing_report.rpt
//Path 1: setup violation at U1/clk -> was the output

4. Write a shell script to check if netlist.v contains the cell NAND2_X1. If found, print "Cell Found", else "Cell Not Found".
if grep - q "NAND_X1" netlist.v
# -q is the option which I learnt from --help which supresses normal output which can also told to be stops grep from printing in the terminal and quietly exits the if statement
then
echo "CELL FOUND"
else
echo "CELL NOT FOUND"
fi

5. From timing_report.rpt, print each line with the word violation and the 2 lines before it.
rep -B 2 "violation" timing_report.rpt
# -B print before number of lines in which we gave 2

6. From sim.log, print each ERROR along with the next 3 lines.Show both the line before and after fatal errors in sim.log.
grep -A 3 "ERROR" sim.log
# to print next 3 lines which has word ERROR
grep -B 1 -A 1 "fatal" sim.log
# to print 1 line before and after the line with fatal
# we can also do -C which I understood later

7. Search for both error and warning in sim.log with a single command.
grep -i -E "error|warning" sim.log
# usinging | to check if the line has error OR warning

8. Use Search cells.txt contents to search from the netlist.v
grep -f cells.txt netlist.v
# -f helps us to find the patterns present in file 1 is present or not in file 2

9. List all Verilog files in the folder that contain the keyword endmodule.
grep -l "endmodule" *.v
# -l is used to find matches and using globbing we can find in every same type file in the directory

10. From alu.v, extract all lines that start with the word always.
# grep "^always" alu.v didn't give me any output becuz it has space in the lines which start with always
grep "[[:space:]]*always" alu.v or grep " *always" alu.v
# which mentions the presence of space and * becomes a whitespace character

11. From truth_table.txt, match the word nand only (not parts like nand2).
grep -w "nand" truth_table.txt # -w is used to match pattern exactly

12. From constraints.sdc, remove comments (lines starting with #).
grep -v "^#" constraints.sdc # -v is used to invert -> here we asked grep to print lines which starts with ^# but -v inverted it so lines other than those gets printed

13. From sim_results.log, print all lines containing numbers.
grep "[0-9]" sim_results.log # prints all the lines which has numbers

14. From netlist.v, identify any line with special characters (non-alphanumeric).
grep -in '[^a-z0-9]' netlist.v # -i is to ignore case, -n is to give line number and to show lines which contains characters other than alphanumeric the above logic is used

15. Write a script that checks if the file timing_report.rpt contains the word slack.
If found, print "Slack Report Available".
Else, print "No Slack Data".
if grep -qi "slack" timing_report_rpt
then
echo "Slack Report Available"
else
echo "No Slack Data"
fi

16. Search for the keyword clk in both netlist.v and alu.v together. Show the filename and matching line.
grep -H "clk" netlist.v alu.v # -H prints filename with output lines

17. Run grep -s "missing" on stdcells.lib. Observe that it suppresses error messages if the pattern doesn’t exist.
grep -s "missing" stdcells.lib # the file didn't have missing in it however, but I understood -s is used to supress if the errors messages occurs like if the file doesn't exist and still it doesnt print any error

18. print the filename along with the line containing the word module.
grep -H "module" *.v # -H prints all the lines in the mentioned in " " of the given filename

19. Use grep -h "pin" in stdcells.lib to print only matches without filenames.
grep -h "pin" stdcells.lib # -h prints same like -H but not module name

20. count number of error messages.
grep -ich "error" * # We get count of each file separately, if we are mentioned with the filename then we can get the proper output

21. Extract all input port definitions from alu.v using grep "input" and redirect them into a new file inputs.txt.
grep "input" alu.v > inputs.txt # push all the lines with input into the new file

22. From alu.v, find lines containing add_r OR xor_r OR and_r.
grep -E "and_r|xor_r|and_r" alu.v # Finding lines with those content

23. In netlist.v, find all gates starting with N or I.
grep -E '^[[:space:]]*(N|I)' netlist.v # Finds only lines which starts with N or I - which are gates in this module

24. In sim_results.log, print only lines ending with clk.
grep -E "clk$" sim_results.log # print lines only which ends with clk

25. Extract only module declarations (module ...) from all .v files.
grep -h "^module" *.v # print all lines which starts with module and dont show module names from all verilog files

26. From truth_table.txt, extract only rows (skip comments starting with #).
grep -v "#" truth_table.txt # print all the lines of the filename except which has #

27. From sim_results.log, find any line where a or b = single digit number.
grep -E -w "a=[0-9]|b=[0-9]" sim_results.log # prints exactly lines which has a and b are single digit number

28. In constraints.sdc, print only lines that define delay constraints (set_input_delay or set_output_delay).
grep -iE "delay" constraints.sdc # prints all the lines which has delay word in it

29. From alu.v, extract all always blocks (both combinational and sequential).
grep "always" alu.v # prints all the lines with always but I have no idea how to print the always block

30. Write a shell script that:
Prompts the user for a cell name.
Searches stdcells.lib for it.
Prints "Available" if found, "Not Available" otherwise.
echo "Read Cell Name:"
read cellname
if grep -q "$cell" stdcells.lib # q is used to do quiet search
then
echo "Available"
else
echo "Not Available"
fi

31. Write a script that checks sim.log for fatal errors. If found, exit with code 1. If no fatal error, exit with 0.
if grep -iq "fatal" sim.log
then
echo "Fatal Error Found"
exit 1
else
echo "No Fatal Error Found"
exit 0
fi

32. Create a list of all Verilog modules present in netlist.v and alu.v by grepping for module and storing results in modules.txt.
grep "module" netlist.v alu.v > modules.txt # push all the lines which has module in it to modules.txt file

33. Find all ports (input/output) defined in alu.v and netlist.v.
grep -E "input|output" netlist.v alu.v # prints all the lines which has input and output words in those files

34. Explore : Extract all standard cell names (NAND2_X1, INV_X1, DFF_X2) from netlist.v using grep with word boundaries (\< \>).
grep -o '\<[A-Z0-9][A-Z0-9]*_[A-Z0-9]*\>' netlist.v # -o prints the parts only which matches and the syntax is the format in which the lines are written inside the module

“We generate fears while we sit. We overcome them by action. Fear is nature’s way of warning us to get busy.” –  Dr. Henry Link
