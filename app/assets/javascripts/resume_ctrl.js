(function () {
  "use strict";

  angular.module("app").controller("resumeCtrl", function($scope, $http, $location, $filter) {

    // the get service below
    $scope.fetchData = function(id) {
      $http.get("/api/v1/students/" + id + ".json").then(function(response) {
        $scope.usersData = response.data;
        $scope.experiences = $scope.usersData.experiences
        $scope.ePanelStatus = "show"
      });
    }

    $scope.editEPanel = function() {
        $scope.ePanelStatus = "edit"
        // $scope.SPanelDeletions = []
    };

    $scope.resetEPanel = function() {
        $scope.ePanelStatus = "show"
    };

      // the post services below
  	$scope.addPersonalInfo = function(firstName, lastName, jobTitle, email, phoneNumber, github, blog, twitter, linkedin, streetAddress, city, state){
  		var student = {first_name: firstName, last_name: lastName, job_title: jobTitle, email: email, phone_number: phoneNumber, github: github, blog: blog, twitter: twitter, linkedin: linkedin, address: streetAddress, city: city, state: state};
      $http.post("/api/v1/students.json", student).then(function(response){
        $scope.students.push(student);
      }), function(error){
        $scope.errors = error.data.errors;
      }
    }

// this is the controller for experience/details

    $scope.jobs = [{details: [{}] }];
    $scope.moreThanOne = function(){
      var moreThanOne = true;
      if ($scope.jobs.length > 1){
        moreThanOne = false;
      }
      return moreThanOne;
    }


    $scope.addNewDetail = function(job) {
      $scope.indexOfJobWithinJobs = $scope.jobs.indexOf(job);
      $scope.indexOfSecondToLastDetail = $scope.jobs[$scope.indexOfJobWithinJobs].details.length - 2
      if ($scope.jobs[$scope.indexOfJobWithinJobs].details.length < 2 || $scope.jobs[$scope.indexOfJobWithinJobs].details[$scope.indexOfSecondToLastDetail]['detail']){
        $scope.jobs[$scope.indexOfJobWithinJobs].details.push( {} );
      }
    };

    $scope.addNewJob = function() {
      $scope.jobs.push({details: [{}]});
    };

    $scope.removeJob = function(job){
      var indexOfJobWithinJobs = $scope.jobs.indexOf(job);
      $scope.jobs.splice(indexOfJobWithinJobs, 1);
    }
      
    $scope.removeDetail = function(job, item) {
      var indexOfJobWithinJobs = $scope.jobs.indexOf(job);
      var indexOfItemWithinDetailsOfTheJob = $scope.jobs[indexOfJobWithinJobs]['details'].indexOf(item);
      $scope.jobs[indexOfJobWithinJobs]['details'].splice(indexOfItemWithinDetailsOfTheJob, 1);
    };

    $scope.addAllExperiences = function(jobs){
      $http.post("/api/v1/experiences.json", jobs).then(function(response){
        $scope.experiences.push(jobs);
      }), function(error){  
        $scope.errors = error.data.errors;
      }
      
    }

//  - - - - - - - - - - - - - - - - - 

// education/education_details:

    $scope.educations = [ {highlights: [{}] } ];

    $scope.jobs = [{details: [{}] }];
      $scope.moreThanOneEducation = function(){
      var moreThanOne = true;
      if ($scope.educations.length > 1){
        moreThanOne = false;
      }
      return moreThanOne;
    }

    $scope.anotherEducationForm = function(){
      $scope.educations.push( {highlights: [{}] } );
    }

    $scope.anotherHighlightForm = function(education, highlight){
      $scope.indexOfEducationWithinEducations = $scope.educations.indexOf(education);
      $scope.indexOfSecondToLastHighlightWithinAllHighlightsOfThisParticularEducation = $scope.educations[$scope.indexOfEducationWithinEducations].highlights.length - 2;
      if ($scope.educations[$scope.indexOfEducationWithinEducations].highlights.length === 1 || $scope.educations[$scope.indexOfEducationWithinEducations].highlights[$scope.indexOfSecondToLastHighlightWithinAllHighlightsOfThisParticularEducation]['highlight']){
        $scope.educations[$scope.indexOfEducationWithinEducations].highlights.push( {} );
      }
    }

    $scope.removeEducationForm = function(education){
      var indexOfParticularEducationWithinEducations = $scope.educations.indexOf(education);
      $scope.educations.splice(indexOfParticularEducationWithinEducations, 1);
    }

    $scope.removeHighlightForm

    $scope.addAllEducations = function(educationsBlob){
      $http.post("/api/v1/educations.json", educationsBlob).then(function(response){
        $scope.educations.push(educationsBlob);
      }), function(error){
        $scope.errors = error.data.errors;
      }
    }

    $scope.addNewProfessionalSkills = function(skills){
      var professional_skill = {skills: [skills]};
      $http.post("/api/v1/professional_skills.json", professional_skill).then(function(response){
        $scope.professional_skills.push(professional_skill);
      }), function(error){
        $scope.errors = error.data.errors;
      }
    }

    $scope.addNewPersonalSkills = function(skills){
      var personal_skill = {skills: [skills]};
      $http.post("/api/v1/personal_skills.json", personal_skill).then(function(response){
        $scope.personal_skills.push(personal_skill);
      }), function(error){
        $scope.errors = error.data.errors;
      }
    }

    $scope.addNewReference = function(firstName, lastName, email, phoneNumber, companyName){
      var reference = {first_name: firstName, last_name: lastName, email: email, phone_number: phoneNumber, company_name: companyName};
      $http.post("/api/v1/references.json", reference).then(function(response){
        $scope.references.push(reference);
      }), function(error){
        $scope.errors = error.data.errors;
      }
    }



    
    window.scope = $scope;

  });
})();