--------------------------ДОМАШКА----------------------------

----------------------ЗАДАНИЕ №1-----------------------------
--Вывести всю информацию из таблицы Sales.Customer 
-------------------------------------------------------------
SELECT * FROM Sales.Customer
GO

----------------------ЗАДАНИЕ №2-----------------------------
--Вывести всю информацию из таблицы Sales.Store отсортированную 
--по Name в алфавитном порядке
-------------------------------------------------------------
SELECT * FROM Sales.Store ORDER BY Name 
GO

----------------------ЗАДАНИЕ №3-----------------------------
--Вывести из таблицы HumanResources.Employee всю информацию
--о десяти сотрудниках, которые родились позже 1989-09-28
-------------------------------------------------------------
SELECT TOP 10 * FROM HumanResources.Employee WHERE {d '1989-09-28'} < BirthDate
GO

----------------------ЗАДАНИЕ №4-----------------------------
--Вывести из таблицы HumanResources.Employee сотрудников
--у которых последний символ LoginID является 0.
--Вывести только NationalIDNumber, LoginID, JobTitle.
--Данные должны быть отсортированы по JobTitle по убиванию
-------------------------------------------------------------
SELECT NationalIDNumber, LoginID, JobTitle FROM HumanResources.Employee WHERE LoginID LIKE '%0' ORDER BY JobTitle DESC
GO

----------------------ЗАДАНИЕ №5-----------------------------
--Вывести из таблицы Person.Person всю информацию о записях, которые были 
--обновлены в 2008 году (ModifiedDate) и MiddleName содержит
--значение и Title не содержит значение 
-------------------------------------------------------------
SELECT * FROM Person.Person WHERE convert(varchar, ModifiedDate, 23) LIKE '2008%' AND MiddleName IS NOT NULL AND Title IS NULL
GO

----------------------ЗАДАНИЕ №6-----------------------------
--Вывести название отдела (HumanResources.Department.Name) БЕЗ повторений
--в которых есть сотрудники
--Использовать таблицы HumanResources.EmployeeDepartmentHistory и HumanResources.Department
-------------------------------------------------------------
SELECT DISTINCT HumanResources.Department.Name FROM HumanResources.EmployeeDepartmentHistory 
JOIN HumanResources.Department
ON HumanResources.Department.DepartmentID = HumanResources.EmployeeDepartmentHistory.DepartmentID WHERE EndDate IS NULL OR EndDate > GETDATE()
GO

----------------------ЗАДАНИЕ №7-----------------------------
--Сгрупировать данные из таблицы Sales.SalesPerson по TerritoryID
--и вывести сумму CommissionPct, если она больше 0
-------------------------------------------------------------
SELECT TerritoryID, SUM(CommissionPct) as CommissionSum FROM Sales.SalesPerson 
GROUP BY TerritoryID HAVING SUM(CommissionPct)> 0
GO

----------------------ЗАДАНИЕ №8-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) 
--которые имеют самое большое кол-во 
--отпуска (HumanResources.Employee.VacationHours)
-------------------------------------------------------------
SELECT *  FROM HumanResources.Employee where VacationHours = 
(
	SELECT MAX(VacationHours) FROM HumanResources.Employee 
)
GO

----------------------ЗАДАНИЕ №9-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) 
--которые имеют позицию (HumanResources.Employee.JobTitle)
--'Sales Representative' или 'Network Administrator' или 'Network Manager'
-------------------------------------------------------------
SELECT *  FROM HumanResources.Employee where JobTitle IN ('Sales Representative','Network Administrator','Network Manager') 
GO

----------------------ЗАДАНИЕ №10-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) и 
--их заказах (Purchasing.PurchaseOrderHeader). ЕСЛИ У СОТРУДНИКА НЕТ
--ЗАКАЗОВ ОН ДОЛЖЕН БЫТЬ ВЫВЕДЕН ТОЖЕ!!!
-------------------------------------------------------------
SELECT * FROM HumanResources.Employee
left join Purchasing.PurchaseOrderHeader
on HumanResources.Employee.BusinessEntityID = Purchasing.PurchaseOrderHeader.EmployeeID
GO