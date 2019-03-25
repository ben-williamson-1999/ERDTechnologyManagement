SELECT customerorder.TotalOrderPrice, branch.AddressLineTwo AS Branch
FROM customerorder
JOIN branch ON customerorder.BranchID=branch.BranchID
WHERE customerorder.TotalOrderPrice >= 1000
ORDER BY customerorder.TotalOrderPrice ASC;