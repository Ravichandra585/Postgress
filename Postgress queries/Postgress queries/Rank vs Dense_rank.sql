create table student_scores
(
	student_id int,
	student_score int
);

insert into student_scores values
(1, 960),
(2, 960),
(3, 950),
(4, 980),
(5, 970),
(6, 970),
(7, 930);

select * from
(select student_id, student_score,
rank() over (order by student_score desc) as student_rank,
dense_rank() over (order by student_score desc) as student_dense
from student_scores)
where student_dense <= 5
order by student_score desc;