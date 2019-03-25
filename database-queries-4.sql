SELECT branch.AddressLineTwo AS BranchName, SUM(customerorder.TotalOrderPrice) AS TurnOverForBranch
FROM branch
JOIN customerorder ON branch.BranchID=customerorder.BranchID
WHERE customerorder.OrderDate > '2019/01/01'
GROUP BY BranchName