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

    $scope.updateAllExperiences = function(experiences){
      $http.patch("/api/v1/experiences/9.json", experiences);
      $scope.ePanelStatus = "show";
    }

    $scope.removeExperience = function(experience){
      var indexOfExperienceWithinExperiences = $scope.experiences.indexOf(experience);
      $scope.experiences.splice(indexOfExperienceWithinExperiences, 1);
    }

    $scope.moreThanOne = function(object){
      var moreThanOne = false;
      if (object.length > 1){
        moreThanOne = true;
      }
      return moreThanOne;
    }

// this is the controller for experience/details

    $scope.jobs = [{details: [{}] }];
    
    $scope.addNewDetail = function(job, item) {
      var indexOfJobWithinJobs = $scope.jobs.indexOf(job);
      var indexOfSecondToLastDetail = $scope.jobs[indexOfJobWithinJobs].details.length - 2;
      if ($scope.jobs[indexOfJobWithinJobs].details.length === 1 || ($scope.jobs[indexOfJobWithinJobs].details[indexOfSecondToLastDetail]['detail'] && (!item['detail'] || $scope.jobs[indexOfJobWithinJobs].details[indexOfSecondToLastDetail + 1]['detail']))){
        $scope.jobs[indexOfJobWithinJobs].details.push( {} );
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

    $scope.anotherHighlightForm = function(education, current_highlight){
      var indexOfParticularEducationWithinEducations = $scope.educations.indexOf(education);
      var educationObjectOfInterest = $scope.educations[indexOfParticularEducationWithinEducations];
      var indexOfSecondToLastHighlightWithinAllHighlightsOfThisParticularEducation = $scope.educations[indexOfParticularEducationWithinEducations].highlights.length - 2;
      if (educationObjectOfInterest.highlights.length === 1 || educationObjectOfInterest.highlights[indexOfSecondToLastHighlightWithinAllHighlightsOfThisParticularEducation]['highlight'] && (!current_highlight['highlight'] || educationObjectOfInterest.highlights[indexOfSecondToLastHighlightWithinAllHighlightsOfThisParticularEducation + 1]['highlight'])){
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
        // $scope.educations.push(educationsBlob);
      }), function(error){
        $scope.errors = error.data.errors;
      }
    }

    // -----------------------------------------------

// professional skills controller

    $scope.professionalSkills = [ {} ]

    $scope.anotherProfessionalSkillForm = function(){
      var indexOfSecondToLastSkillInProfessionalSkills = $scope.professionalSkills.length - 2
      if ($scope.professionalSkills.length === 1 || $scope.professionalSkills[indexOfSecondToLastSkillInProfessionalSkills]['skillKey']){
        $scope.professionalSkills.push( {} );
      }
    }

    $scope.removeProfessionalSkillForm = function(skill){
      var indexOfSkillWithinProfessionalSkills = $scope.professionalSkills.indexOf(skill);
      $scope.professionalSkills.splice(indexOfSkillWithinProfessionalSkills, 1);
    }

    $scope.addNewProfessionalSkills = function(professionalSkillsBlob){
      $http.post("/api/v1/professional_skills.json", professionalSkillsBlob).then(function(response){
        // $scope.professional_skills.push(professionalSkillsBlob);
      }), function(error){
        $scope.errors = error.data.errors;
      }
    }

    // - - - - - - - -- - - -  - - -- - - - - - - - - - -- - 

// personal skills controller

    $scope.personalSkills = [ {} ];

    $scope.anotherPersonalSkillForm = function(skill){
      var indexOfSecondToLastSkillInPersonalSkills = $scope.personalSkills.length - 2;
      if ($scope.personalSkills.length === 1 || ($scope.personalSkills[indexOfSecondToLastSkillInPersonalSkills]['skillKey'] && (!skill['skillKey'] || $scope.personalSkills[indexOfSecondToLastSkillInPersonalSkills + 1]['skillKey']))){
        $scope.personalSkills.push( {} );
      }
    }

    $scope.removePersonalSkillForm = function(skill){
      var indexOfSkillWithinPersonalSkills = $scope.personalSkills.indexOf(skill);
      $scope.personalSkills.splice(indexOfSkillWithinPersonalSkills, 1);
    }

    $scope.addNewPersonalSkills = function(skills){
      var personal_skills = skills;
      $http.post("/api/v1/personal_skills.json", personal_skills).then(function(response){
        // $scope.personalSkills.push(personal_skills);
      }), function(error){
        $scope.errors = error.data.errors;
      }
    }

    // - - - - - - - - - - - - --  -- - - - - - - - - - - - - - - -- - - 

    // references controller

    $scope.references = [ {} ]

    $scope.anotherReferenceForm = function(){
      $scope.references.push( {} );
    }

    $scope.removeReferenceForm = function(reference){
      var indexOfParticularReferenceWithinReferences = $scope.references.indexOf(reference);
      $scope.references.splice(indexOfParticularReferenceWithinReferences, 1);
    }

    $scope.addNewReferences = function(referencesBlob){
      var references = referencesBlob;
      $http.post("/api/v1/references.json", references).then(function(response){
      // $scope.manyReferences.push(references);
      }), function(error){
        $scope.errors = error.data.errors;
      }
    }




    window.scope = $scope;

  });
})();


