## PS 3
## Omar Abdelsalam, 3042974730

## Git and GitHub
##For the following questions, consider the file system below. You begin working in a shell at the Home directory, ~.
#~
#├── practice
#│ ├── ex1.R
#│ └── ex2.R
#└── my-project
##├── README.md
##└── scripts
###├── data-cleaning.R
###└── modeling.R

# 1: If you run the ls command, what will the output be?

# Running ls will return the directory path, along with the folders within the ~ directory (practice, myproject).

# 2: What commands would you run to move into my-project and designate that directory as a git repository?

# Run cd my-project then run git init to designate it as a repository.

# 3: When you designate an existing directory as a git repo and it already has files in it, they will be neither staged nor committed.
# What single command could you use to stage the existing three files? 
# Note that you can add multiple files at once by separating them by a space (see the wedding example)¹

# To stage the files, I would use git add . to add all the files.

# 4: Once all of the files are staged, write the command can be used to take a snapshot of the state of those files along with a helpful caption

# I would run git commit -m "Initial commit"

# 5: Say that the project has a Part 1 and a Part 2. These existing files accomplish Part 1. 
# To accomplish Part 2, you add several dozen lines of new code to data-cleaning.R and write and save a new script called visualization.R right alongside it. 
# What commands would you run to store those changes along with a helpful description?

# I would run git add . to add them to the repo then run git commit -m "New additions to data-cleaning & new visualization script".