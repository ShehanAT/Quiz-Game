// $.ajax({
//     url: "/games",
//     dataType: "json",
//     method: "post",
//     data: {

//     },
//     success: function(data){
//         console.log(data);
//         $("#quiz_question").text(data.quiz.question);
//         $("#answer1").val(data.answers[0].answer);
//         $("#answer1").parent().attr("action", `games?answerId=${data.answers[0].answerId}&quizId=${data.quiz.id}`);
//         $("#answer2").val(data.answers[1].answer);
//         $("#answer2").parent().attr("action", `games?answerId=${data.answers[1].answerId}&quizId=${data.quiz.id}`);
//         $("#answer3").val(data.answers[2].answer);
//         $("#answer3").parent().attr("action", `games?answerId=${data.answers[2].answerId}&quizId=${data.quiz.id}`);
//         $("#answer4").val(data.answers[3].answer);
//         $("#answer4").parent().attr("action", `games?answerId=${data.answers[3].answerId}&quizId=${data.quiz.id}`);
//     }
// });