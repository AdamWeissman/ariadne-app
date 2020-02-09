### WHAT IS ARIADNE?
ARIADNE is a web app that helps you untangle complicated problems by transforming the chore of list writing into a more introspective activity.

### WHO IS ARIADNE (what's in the name?)
In Greek mythology, Ariadne is the princess that helped Theseus navigate an evil King's maze, slay a minotaur, and win the prize.  She did so by giving Theseus a ball of yarn that he could use to track his way out of the maze...  A lot of times, projects can FEEL like epic mazes where every obstacle is a monster waiting to gobble you up.  Ariadne (The Web App) helps you get out alive.

### WHO IS IT FOR?
Anyone that has a problem (or project) with multiple steps.  Since the human mind can typically keep about 7 things max in working memory, Ariadne is more useful for endeavors that have more than 7 steps.   If you know all the tasks you need to complete, but not in what order, then Ariadne is for you.  If you know the problems you're stuck on or obstacles you face (with no idea where to begin) then Ariadne will help you get started.  Planning a large coding project?  Ariadne is for you.  Planning a novel or screenplay?  Ariadne is for you.  Planning a Sweet Sixteen?  Ariadne is for you.  Going on your dream vacation and want to maximize your time?  Ariadne is for you.  Doing a spring cleaning on a distant relative's Haunted Hoarder House?  Ariadne is for you.   

# SETUP AND RUN
1) Visit https://github.com/AdamWeissman/ariadne-app (you're probably there right now)
2) Clone it down to your computer.  You can also FORK it first, and then clone it (depending on your purposes).
3) Open your terminal, "cd" to the "ariadne-app" root folder.
4) Type "bundle install" to run and load the required Ruby gems and dependencies.
5) Type "rake db:migrate" to create a new database from the migration tables stored under db/migrate.
6) Type "shotgun" in the root directory and Ariadne will then be accessible in your web browser.
6a) Shotgun will tell you where your local host is.  It says something like "Shotgun/Thin on http://127.0.0.1:9393/"
7) SEMI-IRRELEVANT NOTE IF YOU DON'T PLAN TO EDITING HTML OR CSS: If this isn't your first time using the program, or if you edit the HTML/CSS code etc., you will probably want to clear your browsing history before checking out visual updates.  Some of the text and backgrounds pulse/glow so your local browser will cache that stuff to save on memory; thus if you make changes to colors or other visuals, it may not grab the newest appearance.
8) That's it!  Feel free to use the program.

# OOPS WAIT!!! IMPORTANT INFO FOR LOGIN.
When you're on the the signup page you will need to type "flatiron" (no quotes, just: flatiron) into the "enter the key you received field", otherwise you won't be able to setup a user.

## HOW TO USE ARIADNE
1) type in your first name, type in your email... it can be fake as long as it follows convention, type in a password, type in "flatiron" to the "enter the key" field.
2) Login with your email and your password
... it will greet you as if you were Theseus, by adding eus to the end of your name.
3) Click create a project.
4) Enter a project name and also a brief summary (to help focus you on what you're doing)
5) In the big text box, READ THE TEXT THAT IS THERE.
5a) If you don't want to read the text that is there, just do this...
5b) Related to the project you're tackling, type in a bunch of problems that you face.  Feel free to go wild and embrace your subconscious.
5c) Rephrase those problems/obstacles as tasks to be completed by putting the text between a t: and an e: (it's explained in the program)
6) Hit preview.
6a) Make sure everything looks correct.  If not click Make Adjustments.  If yes click Let's Continue.
6b) REEEAAALLLLYY IMPORTANT... YOU MUST HAVE A MINIMUM OF THREE TASKS... THAT MEANS YOU MUST HAVE 3 TASKS. 1, 2, 3.
7) Glance over the tasks you've created.  Perhaps you want to rephrase one?  Edit the text and click save.  It edits it in place.  OR, did you just realize that one of your tasks is totally irrelevant? Then click the delete button.  Have you forgotten something?  Type new text into the empty box and click ADD A TASK.  Or ADD A TASK even if it's empty... just make sure to put your task in there and then click save.  NOTE: YOU CANNOT DO A MASS EDIT HERE.  So, you must SAVE after each edit.
8) Click PHASE II
9) To make you smarter about the context of the tasks you've created, Ariadne poses a bunch of "throwaway" prompts about each task.  Don't think too hard about it, but do consider it in order to reap maximum reward from the process.  There's text in the box that says "you must change this to continue" ... and it's serious!  If you don't change the text... even to a blank space, you'll be trapped on that page, even if you hit the submit button.
10) You will then be brought to a page (that you are trapped on unless you select a radial from each column).  Select the radial that best suits your task.  Essentially you are ranking your tasks as Easy, Difficult, Not Sure... Fast, Slow, Uncertain... Necessary, Optional, Not Sure.  Ariadne uses this to rank your tasks in secret.
11) Once your done editing and updating all those tasks you will then be asked to choose the relevant segment.  NOTE: You must choose a segment from each category (one foundational, one intermediary, and one final).  If you skimmed 6b above then you'll get some weird data after this portion completes.
12) Click NEXT
13) You're given another chance to add or delete tasks.  WARNING: Make sure you don't delete to less than one task in any given segment.  It'll screw up your data.
13b) SO, if you want to add a new task and delete a task.  PLEASE add one first.
13c) Want to edit a task.  Just change the text and click save.
14) Click LOOKS GOOD, CONTINUE.
15) Ariadne has your suggested order of tasks listed in the auto rank column.  You then type integers in the "reorder to your preference" column to correct anything the program did wrong.
16) That's it.  THE END.
17) or... you could just watch the walkthrough video posted here.

<iframe width="560" height="315" src="https://www.youtube.com/embed/fE5frcJ7C04" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


### LICENSE
This project is licensed under the MIT License - see the <a href="https://github.com/AdamWeissman/ariadne-app/blob/master/LICENSE.md">license file</a> for details.
