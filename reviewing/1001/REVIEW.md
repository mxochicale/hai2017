# Overall Rating
Provide your overall rating of the paper.

￼		X 5 - 	Definite accept: I would argue strongly for accepting this paper.
￼		4 - 	Probably accept: I would argue for accepting this paper.
￼		3 - 	Borderline: Overall I would not argue for accepting this paper.
￼		2 - 	Probably reject: I would argue for rejecting this paper.
￼		1 - 	Definite reject: I would argue strongly for rejecting this paper.


# Expertise

Provide your expertise in the topic area of this paper.

￼		4 - 	Expert
￼		3 - 	Knowledgeable
￼		X 2 - 	Passing Knowledge
￼		1 - 	No Knowledge


# The Review

Write your review of the paper here. Please identify positive and negatives of the work and the paper, plus any suggestions for revisions.

￼



Comments to Committee (Hidden from authors)

Comments for the review committee that will NOT be sent to the authors:

￼

￼Submit the review

After submitting, you can return to this page to edit your review up to the review deadline (August 10, 2017).




# First Round Review on 1st August 2017

The gap for the novelty is not entirely clearly!

While robots have grounded spatial
concepts for object placement in previous work, limitations
typically include elaborate concept representations together
with either pre-built concepts [9] or extended learning [5]. The
focus of the work presented in this paper is simple and mini-
mal interactions together with simple internal representations
for learning spatial relationships for objects on a table.


misspelling: langauge @ BACKGROUND

can you specify how many years? one decate? two decates?
Robots have been learning language for many years, either
from each other or from humans


The environment consisting of robot, table, human?, and objects
where is the human in Figure 1?
it would be nice to show the objects

I am not sure how helpfull is to mention the dimension of the chair as well
and the separation between the table,.


It would be good for the reader that you mention who
propose the confidence equation, c ij for this paper?
in case you take it from other author, cite it

if not, cite the author of the confidence formula.


Results with Capitals


"The results for other surfaces were qualitatively the same as
for the original table. For object selection, the grid lexicons
were consistent for 24 selections for the rotated table and for
23 selections for the larger square table, while the exemplar
lexicons were consistent for 18 selections for the rotated table
and 19 selections for the square table. For the placement task,
the difference in position was the same relative to percentage
of table size, as the framework is scaled to the size of the table."

when you use qualitatively the same, I believe that you should provide a
statistical analysis. Addtionally, it is a bit hard to understand
the meaning of , for example, 24 selections (where sometime is missing,
  like 24 out of a certain number)
for the ratated table



this might be silly, but the paper does not not spedicy
 which are those words that the robot learns

 you use sometimes tabletop or table-top. in the conclusions
 be consitent




# Second Round Review. 3st August 2017

the authors propose an approach
that is based on simple internal represenations
for  PR2 robot to quyicky learn spacial relationships for objects over a table
that can be generalise for tables of different dimenstiosn.

which addresses the limitation of in previous studies
where of elaboration of concept representation with
pre-built concepts are need or extending learning representations
are needed.

Proving a well "structured" (find another word) literature review in the background section
and possing
why the work is importand.



* with human teacher proving examplars of words
exmaplars lexicons
or
indicating where the words may nbe used over the table
grid lexicons

* exmaplars lexicons is more consisten than grid lexicons
but grid lexicons  is much quicker for learning
than exmaplars lexicons


the paper is well-written

Major Comments:

* I did a search on gogle schoolar and  techniques for distributed lexicons
(Schulz 2012) has been  cited 4 times and (Schulz 2011) 14 times to August 2017.
I am wondering if those are the state-of-the-art techniques
for language represnetations and which are the advantanges and limitation of such
approach.

Minor Comments:


* For the Robot System, for replication purpose, it is suggested that the authors
release their source code where you provide further information about the
machines, the robot, Linux and ROS distrutions.



* the order of "the environment, the robot, the interactions, language
representations, and lexicon evaluation" is different than the one which
is presented in the SYSTEM section.


* It would be read it better with a parallel structure:
"an average of 29 seconds to complete, compared to an average of 3 minutes and
  30 seconds for the grid condition compared to an avarage of ?? ??."



* It might be my lack of knowledge, but I believe that a better explanation of
the results might be helpful for the readear. I strugle to understand the
meaning of consistency with regard to the number of sections.

* for the Fiture 2 and 3, authors might add some description above the
plots to make the readers easily to get the robot's examplar, and grid lexicon
and teh word representation of each row besides the plots.


# Third Round and Submission of Reviews on XX August 2017


The authors propose an approach that is based on simple internal represenations
for PR2 robot to quyicky learn spacial relationships for objects over a table,
the approach is very useufl as it can be generalised for tables of different
dimensions. It is conluded that examplars lexicons are more consistent than grid
lexicons but grid lexicons are much quicker for learning representations
than examplars lexicons. The paper also provides a well structured format and the literature
review is vastly enought to pose the importance of the work.
These are some of my major and minor comments that can make the paper stronger.


## Major Comments:

* I did a search on gogle schoolar and  techniques for distributed lexicons
(Schulz 2012) has been  cited 4 times and (Schulz 2011) 14 times to August 2017.
I am wondering if those are the state-of-the-art techniques
for language represnetations and which are the advantanges and limitation of such
approaches.

* It would be good for the reader that you mention who propose the confidence
equation, "c_ij" in the paper.

* For this paragraph:
"The results for other surfaces were *qualitatively* the same as
for the original table. For object selection, the grid lexicons
were consistent for 24 selections for the rotated table and for
23 selections for the larger square table, while the exemplar
lexicons were consistent for 18 selections for the rotated table
and 19 selections for the square table. For the placement task,
the difference in position was the same relative to percentage
of table size, as the framework is scaled to the size of the table."

when you use *qualitatively*, I believe that you should provide a
some kind of statistical analysis to make a stronger argument.

* It might be my lack of knowledge, but I think that a better explanation of
the results might be helpful for the reader. Honestly, I strugle to understand
the meaning of consistency with regard to the number of sections.

## Minor Comments:

* For replication purpose, it is suggested that the authors
release their source code where you provide further information about the
machines, the robot, Linux and ROS distrutions.

* The order of "the environment, the robot, the interactions, language
representations, and lexicon evaluation" is different than the one which
is presented in the SYSTEM section.

* The following sentece would better with a parallel structure:
"an average of 29 seconds to complete, compared to an average of 3 minutes and
  30 seconds for the grid condition compared to an avarage of ?? ??."

* for the Figure 2 and 3, authors might add some description above the
plots to get the robot's examplar easily; also some labels to the grid lexicon
and the word representation would be helpful.

* Can you specify how many years? one decate? two decates?
In "Robots have been learning language for many years, either
from each other or from humans"

* Can you include a human in Figure 1? It would also be nice to include the objects.

* I am not sure how helpfull is to mention the dimension of the chair as well
and the separation between the table,.

* You use tabletop or table-top. stick to one word!

* misspelling: langauge at BACKGROUND section.

* Results with Capitals letters
