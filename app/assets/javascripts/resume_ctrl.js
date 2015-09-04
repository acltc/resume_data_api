(function () {
  "use strict";

  angular.module("app").controller("resumeCtrl", function($scope, $http, $location, $filter) {

    $scope.fetchData = function(id) {
      $scope.userID = id

      $http.get("/api/v1/students/" + $scope.userID + ".json").then(function(response) {
        $scope.usersData            = response.data;
        $scope.personalInformation  = [$scope.usersData.personal_information];
        $scope.experiences          = $scope.usersData.experiences;
        $scope.educations           = $scope.usersData.educations;
        $scope.professionalSkills   = $scope.usersData.professional_skills;
        $scope.personalSkills       = $scope.usersData.personal_skills;
        $scope.referecnces          = $scope.usersData.references;

        $scope.pPanelStatus                 = "show";
        $scope.ePanelStatus                 = "show";
        $scope.educationPanelStatus         = "show";
        $scope.professionalSkillPanelStatus = "show";
        $scope.personalSkillsPanelStatus    = "show";
        $scope.referecncesPanelStatus       = "show";
      });
    }

// the post services below
    $scope.addPersonalInfo = function(firstName, lastName, jobTitle, email, phoneNumber, github, blog, twitter, linkedin, streetAddress, city, state){
      var student = {first_name: firstName, last_name: lastName, job_title: jobTitle, email: email, phone_number: phoneNumber, github: github, blog: blog, twitter: twitter, linkedin: linkedin, address: streetAddress, city: city, state: state};
      $http.post("/api/v1/students.json", student).then(function(response){
        $scope.students.push(student);
      }), function(error){
        $scope.errors = error.data.errors;
      }
    }

// the get services below

    $scope.updatePersonalInformation = function(personal_info_array){
      $http.patch("/api/v1/students/" + $scope.userID + ".json", personal_info_array).then(function(response){
        $scope.usersData = response.data;
        $scope.personalInformation = [$scope.usersData.personal_information];
        $scope.resetPPanel();
      })
    }
    // $scope.formatedDate = function(dates) {
    //   new Date(2014, 3, 19);
    // }

    $scope.dateBirth = new Date(2014, 3, 19);

// this is the controller for personal information
    $scope.editPPanel = function() {
        $scope.pPanelStatus = "edit"
        // $scope.SPanelDeletions = []
    };

    $scope.resetPPanel = function() {
        $scope.pPanelStatus = "show"
    };
    

// this is the controller for experience/details


    $scope.setDate = function(aDate) {
      // doesn't work yet
      $scope.value = $filter('date')(aDate, "yyyy-MM-dd");
    }

    $scope.moreThanOne = function(object){
      var moreThanOne = false;
      if (object.length > 1){
        moreThanOne = true;
      }
      return moreThanOne;
    }

    $scope.experiences = [{details: [{}] }];
    
    $scope.addNewexperience = function() {
      $scope.experiences.push({details: [{}]});
    };

    $scope.addNewDetail = function(experience, detail) {
      var indexOfexperienceWithinexperiences = $scope.experiences.indexOf(experience);
      var indexOfSecondToLastDetail = $scope.experiences[indexOfexperienceWithinexperiences].details.length - 2;
      if ($scope.experiences[indexOfexperienceWithinexperiences].details.length === 1 || ($scope.experiences[indexOfexperienceWithinexperiences].details[indexOfSecondToLastDetail]['detail'] && (!detail['detail'] || $scope.experiences[indexOfexperienceWithinexperiences].details[indexOfSecondToLastDetail + 1]['detail']))){
        $scope.experiences[indexOfexperienceWithinexperiences].details.push( {} );
      }
    };

    // $scope.removeexperience = function(experience){
    //   var indexOfexperienceWithinexperiences = $scope.experiences.indexOf(experience);
    //   $scope.experiences.splice(indexOfexperienceWithinexperiences, 1);
    // }
      
    $scope.removeDetail = function(experience, detail) {
      var indexOfexperienceWithinexperiences = $scope.experiences.indexOf(experience);
      var indexOfdetailWithinDetailsOfTheexperience = $scope.experiences[indexOfexperienceWithinexperiences]['details'].indexOf(detail);
      $scope.experiences[indexOfexperienceWithinexperiences]['details'].splice(indexOfdetailWithinDetailsOfTheexperience, 1);
    };

    $scope.addAllExperiences = function(experiences){
      $http.post("/api/v1/experiences.json", experiences).then(function(response){
        $scope.experiences.push(experiences);
      }), function(error){  
        $scope.errors = error.data.errors;
      }
    }

    $scope.editEPanel = function() {
      $scope.ePanelStatus = "edit";
      angular.forEach($scope.experiences, function(experience){
        if (experience.details == false || experience.details[(experience.details.length) - 1].detail){
          experience.details.push( {} );
        }
      })
      // $scope.SPanelDeletions = []
    };

    $scope.resetEPanel = function() {
      $http.get("/api/v1/students/" + $scope.userID + ".json").then(function(response) {
        $scope.usersData = response.data;
        $scope.experiences = $scope.usersData.experiences;
        $scope.ePanelStatus = "show";
      });
    };

    $scope.updateAllExperiences = function(experiences){
      $http.patch("/api/v1/experiences/" + $scope.userID + ".json", experiences).then(function(response){
      $scope.resetEPanel();
      });
    }

    $scope.removeExperience = function(experience){
      var indexOfExperienceWithinExperiences = $scope.experiences.indexOf(experience);
      $scope.experiences.splice(indexOfExperienceWithinExperiences, 1);
    }

// education/education_details:

    $scope.educations = [ {highlights: [{}] } ];

    $scope.anotherEducationForm = function(){
      $scope.educations.push( {highlights: [{}] } );
    }

    $scope.removeEducationForm = function(education){
      var indexOfParticularEducationWithinEducations = $scope.educations.indexOf(education);
      $scope.educations.splice(indexOfParticularEducationWithinEducations, 1);
    }

    $scope.anotherHighlightForm = function(education, current_highlight){
      var indexOfParticularEducationWithinEducations = $scope.educations.indexOf(education);
      var educationObjectOfInterest = $scope.educations[indexOfParticularEducationWithinEducations];
      var indexOfSecondToLastHighlightWithinAllHighlightsOfThisParticularEducation = $scope.educations[indexOfParticularEducationWithinEducations].highlights.length - 2;
      if (educationObjectOfInterest.highlights.length === 1 || educationObjectOfInterest.highlights[indexOfSecondToLastHighlightWithinAllHighlightsOfThisParticularEducation]['highlight'] && (!current_highlight['highlight'] || educationObjectOfInterest.highlights[indexOfSecondToLastHighlightWithinAllHighlightsOfThisParticularEducation + 1]['highlight'])){
        educationObjectOfInterest.highlights.push({});
      }
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

    $scope.updateAllEducations = function(educationsBlob){
      $http.patch("/api/v1/educations/" + $scope.userID + ".json", educationsBlob).then(function(response){
        $scope.educations = response.data.educations;
        $scope.resetEducationPanel();
      })
    }

    $scope.editEducationPanel = function() {
        $scope.educationPanelStatus = "edit"
        // $scope.SPanelDeletions = []
    };
  
    $scope.resetEducationPanel = function() {
        $scope.educationPanelStatus = "show"
    };

// professional skills controller
    $scope.editProfessionalSkillsPanel = function() {
        $scope.professionalSkillPanelStatus = "edit"
    };

    $scope.resetProfessionalSkillsPanel = function() {
        $scope.professionalSkillPanelStatus = "show"
    };

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

// personal skills controller

    $scope.editPersonalSkillsPanel = function() {
        $scope.personalSkillsPanelStatus = "edit"
    };

    $scope.resetPersonalSkillsPanel = function() {
        $scope.personalSkillsPanelStatus = "show"
    };

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


// references controller
    $scope.editReferecncesPanel = function() {
        $scope.referecncesPanelStatus = "edit"
    };

    $scope.resetReferecncesPanel = function() {
        $scope.referecncesPanelStatus = "show"
    };

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


