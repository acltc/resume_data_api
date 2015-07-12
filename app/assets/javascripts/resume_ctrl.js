(function () {
  "use strict";

  angular.module("app").controller("resumeCtrl", function($scope, $http, $location, $filter) {

      // the post services below
  	$scope.addPersonalInfo = function(firstName, lastName, jobTitle, email, phoneNumber, github, blog, twitter, linkedin, streetAddress, city, state){
  		var student = {first_name: firstName, last_name: lastName, job_title: jobTitle, email: email, phone_number: phoneNumber, github: github, blog: blog, twitter: twitter, linkedin: linkedin, address: streetAddress, city: city, state: state};
      $http.post("/api/v1/students.json", student).then(function(response){
        $scope.students.push(student);
      }), function(error){
        $scope.errors = error.data.errors;
      }
    }

    $scope.moreThanOne = function(object){
      var moreThanOne = false;
      if (object.length > 1){
        moreThanOne = true;
      }
      return moreThanOne;
    }


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

    $scope.setDate = function(aDate) {
      // doesn't work yet
      $scope.value = $filter('date')(aDate, "yyyy-MM-dd");
    }

// this is the controller for experience/details

    $scope.jobs = [{details: [{}] }];
    
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

    $scope.anotherEducationForm = function(){
      $scope.educations.push( {highlights: [{}] } );
    }

    $scope.anotherHighlightForm = function(education){
      var indexOfParticularEducationWithinEducations = $scope.educations.indexOf(education);
      var educationObjectOfInterest = $scope.educations[indexOfParticularEducationWithinEducations];
      var indexOfSecondToLastHighlightWithinAllHighlightsOfThisParticularEducation = $scope.educations[indexOfParticularEducationWithinEducations].highlights.length - 2;
      if (educationObjectOfInterest.highlights.length === 1 || educationObjectOfInterest.highlights[indexOfSecondToLastHighlightWithinAllHighlightsOfThisParticularEducation]['highlight']){
        educationObjectOfInterest.highlights.push({});
      }
    }

    $scope.removeEducationForm = function(education){
      var indexOfParticularEducationWithinEducations = $scope.educations.indexOf(education);
      $scope.educations.splice(indexOfParticularEducationWithinEducations, 1);
    }

    $scope.removeHighlightForm = function(education, highlight){
      var indexOfParticularEducationWithinEducations = $scope.educations.indexOf(education);
      var educationObjectOfInterest = $scope.educations[indexOfParticularEducationWithinEducations];
      var indexOfParticularHighlightWithinAllHighlightsForThisEducationObjectOfInterest = educationObjectOfInterest.highlights.indexOf(highlight);
      educationObjectOfInterest.highlights.splice(indexOfParticularHighlightWithinAllHighlightsForThisEducationObjectOfInterest, 1);
    }

    $scope.addAllEducations = function(educationsBlob){
      $http.post("/api/v1/educations.json", educationsBlob).then(function(response){
        $scope.allEducations.push(educationsBlob);
      }), function(error){
        $scope.errors = error.data.errors;
      }
    }

    // -----------------------------------------------

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


