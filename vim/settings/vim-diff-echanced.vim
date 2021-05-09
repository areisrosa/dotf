if &diff
	" Much nicer diffs result by using the histogram algorithm.
	let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=histogram")'
endif
