SELECT AVG(customerorder.TotalOrderPrice) AS AverageOrderPrice, MAX(customerorder.TotalOrderPrice) AS LargestOrder, MIN(customerorder.TotalOrderPrice) AS MinimumOrder
FROM customerorder
JOIN branch ON customerorder.BranchID=branch.BranchID
WHERE branch.AddressLineTwo = 'york'