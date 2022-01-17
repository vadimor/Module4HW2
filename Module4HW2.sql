--------------------------�������----------------------------

----------------------������� �1-----------------------------
--������� ��� ���������� �� ������� Sales.Customer 
-------------------------------------------------------------
SELECT * FROM Sales.Customer
GO

----------------------������� �2-----------------------------
--������� ��� ���������� �� ������� Sales.Store ��������������� 
--�� Name � ���������� �������
-------------------------------------------------------------
SELECT * FROM Sales.Store ORDER BY Name 
GO

----------------------������� �3-----------------------------
--������� �� ������� HumanResources.Employee ��� ����������
--� ������ �����������, ������� �������� ����� 1989-09-28
-------------------------------------------------------------
SELECT TOP 10 * FROM HumanResources.Employee WHERE {d '1989-09-28'} < BirthDate
GO

----------------------������� �4-----------------------------
--������� �� ������� HumanResources.Employee �����������
--� ������� ��������� ������ LoginID �������� 0.
--������� ������ NationalIDNumber, LoginID, JobTitle.
--������ ������ ���� ������������� �� JobTitle �� ��������
-------------------------------------------------------------
SELECT NationalIDNumber, LoginID, JobTitle FROM HumanResources.Employee WHERE LoginID LIKE '%0' ORDER BY JobTitle DESC
GO

----------------------������� �5-----------------------------
--������� �� ������� Person.Person ��� ���������� � �������, ������� ���� 
--��������� � 2008 ���� (ModifiedDate) � MiddleName ��������
--�������� � Title �� �������� �������� 
-------------------------------------------------------------
SELECT * FROM Person.Person WHERE convert(varchar, ModifiedDate, 23) LIKE '2008%' AND MiddleName IS NOT NULL AND Title IS NULL
GO

----------------------������� �6-----------------------------
--������� �������� ������ (HumanResources.Department.Name) ��� ����������
--� ������� ���� ����������
--������������ ������� HumanResources.EmployeeDepartmentHistory � HumanResources.Department
-------------------------------------------------------------
SELECT DISTINCT HumanResources.Department.Name FROM HumanResources.EmployeeDepartmentHistory 
JOIN HumanResources.Department
ON HumanResources.Department.DepartmentID = HumanResources.EmployeeDepartmentHistory.DepartmentID WHERE EndDate IS NULL OR EndDate > GETDATE()
GO

----------------------������� �7-----------------------------
--������������ ������ �� ������� Sales.SalesPerson �� TerritoryID
--� ������� ����� CommissionPct, ���� ��� ������ 0
-------------------------------------------------------------
SELECT TerritoryID, SUM(CommissionPct) as CommissionSum FROM Sales.SalesPerson 
GROUP BY TerritoryID HAVING SUM(CommissionPct)> 0
GO

----------------------������� �8-----------------------------
--������� ��� ���������� � ����������� (HumanResources.Employee) 
--������� ����� ����� ������� ���-�� 
--������� (HumanResources.Employee.VacationHours)
-------------------------------------------------------------
SELECT *  FROM HumanResources.Employee where VacationHours = 
(
	SELECT MAX(VacationHours) FROM HumanResources.Employee 
)
GO

----------------------������� �9-----------------------------
--������� ��� ���������� � ����������� (HumanResources.Employee) 
--������� ����� ������� (HumanResources.Employee.JobTitle)
--'Sales Representative' ��� 'Network Administrator' ��� 'Network Manager'
-------------------------------------------------------------
SELECT *  FROM HumanResources.Employee where JobTitle IN ('Sales Representative','Network Administrator','Network Manager') 
GO

----------------------������� �10-----------------------------
--������� ��� ���������� � ����������� (HumanResources.Employee) � 
--�� ������� (Purchasing.PurchaseOrderHeader). ���� � ���������� ���
--������� �� ������ ���� ������� ����!!!
-------------------------------------------------------------
SELECT * FROM HumanResources.Employee
left join Purchasing.PurchaseOrderHeader
on HumanResources.Employee.BusinessEntityID = Purchasing.PurchaseOrderHeader.EmployeeID
GO