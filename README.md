# Code Test

This is a code test that demonstrates my level of expertise and coding style.

It does not include all elements of the full stack developer test, and has been completed as a Shiny Dashboard rather than React as that is what I am more comfortable with. I have interpreted some of the requirements differently as a result of this.

Regarding the requirements: 
- Create a git repository – we’re using GitLab but you can use another ___COMPLETE___
- Create a web application by using React (https://reactjs.org) ___USED R/SHINY INSTEAD___
- The homepage must include a form with the following mandatory fields: 
  - Name ___COMPLETE___
  - Email ___COMPLETE___
  - Pin number (must be 4 digit) ___PARTIAL, 4 DIGIT REQUIREMENT NOT MET___
  - Message (max length 48 characters) ___PARTIAL, MAX LENGTH REQUIREMENT NOT MET___
- Input values must be stored in a database table once submitted ___COMPLETE___
- The listing page `/list` must include a table with the following columns: ___ALTERNATIVE PARTIALLY COMPLETE, DASHBOARD CONTAINS A TABLE OF MESSAGES___
  - Date/Time: display entry created datetime in ISO 8601 ___COMPLETE___
  - Name: display the name stored in the database ___COMPLETE___
  - Message: display a `Reveal` button that show a modal with an input field to validate the pin number, then fetch the message or throw an error when invalid ___NOT COMPLETE___
- Add ability to export a CSV with unique emails and respective counts ___COMPLETE___

The dashboard is deployed [here](https://howsnich10.shinyapps.io/code_test/) at shinyapps.io.
