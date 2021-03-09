$(document).ready(function() {
  $('.employee_dep').click(function() {
    let selectedEmpId = $(this).data('emp-id');
    let employeeData = selectedEmployeeRow(selectedEmpId);
    setEmployeeData(employeeData);

    $('#employee_department_dialog').show();

    $('.update_dep').click(function() {
      let updatedDep = $(".departments").val();
      $.ajax({
        url: '/employees/' + selectedEmpId + '/departments',
        type: "PUT",
        data: { department_id: updatedDep }
      });
    });

    $('.cancel').click(function() {
      $('#employee_department_dialog').hide();      
    });
  });


  function selectedEmployeeRow(selectedEmpId) {
    let id = $('#employee_data_'+ selectedEmpId).attr('id');
    let firstName = getEmployeeData(id, '.first_name');
    let lastName = getEmployeeData(id, '.last_name');
    let fullName = firstName + ' ' + lastName; 
    let dept_id = $('#'+ id +' .department').data('dep-id');
    return { name: fullName, dept_id: dept_id };
  }

  function getEmployeeData(empId, field) {
    return $('#'+ empId + ' ' + field).text()
  }

  function setEmployeeData(employeeData) {
    $(".emp_name").text(employeeData['name']);
    $(".departments option[value='"+ employeeData['dept_id'] +"']").attr("selected", "selected");
  }


  $(".departments").click(function() {
    let depId = $(".departments option:selected").val()
    $.ajax({
      url: '/departments/' + depId,
      type: "GET",
      success: function(data) {
         if (data.length > 0) {
           $(".department_employees").text(data);
         } else {
           $(".department_employees").text("There are no employees");
         }
      },
    })
    
  })
});

