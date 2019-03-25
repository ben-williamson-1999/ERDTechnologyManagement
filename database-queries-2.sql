SELECT supplier.Name AS SupplierName, supplierorderitem.Quantity, stockitem.Name AS StockName
FROM supplierorder

JOIN supplier ON supplierorder.SupplierID=supplier.SupplierID
JOIN supplierorderitem ON supplierorder.SupplierOrderID=supplierorderitem.SupplierOrderID
JOIN stockitem ON supplierorderitem.StockID=stockitem.StockID