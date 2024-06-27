  /*
  Create a Java class 'Employee'.
  Details:
  - The class is abstract.
  - The class has the following nullable public properties:
    - Id (int, read-only)
    - ReportsTo (int)
    - Name (string)
    - Email (string)
    - Mobile (string)
    - DepartmentId (int)
  - The class has a public c'tor that accepts all the properties as parameters.
  - The class has the following public properties:
    - Payment (double) - get-only, abstract
  - The class has the following public methods:
    - EmployeeDetails (string) - get-only, virtual
  */

 package com.iluwatar.abstractdocument;

public abstract class Employee {

    private final int id;
    private Integer reportsTo;
    private String name;
    private String email;
    private String mobile;
    private int departmentId;

    public Employee(int id, Integer reportsTo, String name, String email, String mobile, int departmentId) {
        this.id = id;
        this.reportsTo = reportsTo;
        this.name = name;
        this.email = email;
        this.mobile = mobile;
        this.departmentId = departmentId;
    }

    public int getId() {
        return id;
    }

    public Integer getReportsTo() {
        return reportsTo;
    }

    public void setReportsTo(Integer reportsTo) {
        this.reportsTo

