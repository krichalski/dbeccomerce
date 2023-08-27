Use ecommerce2;
--
SELECT trackingCode FROM delivery Where deliveryStatus = 'Pendente'

--
SELECT Pname, avaliacao FROM products 
order by avaliacao desc



--
SELECT products.Pname, seller.SocialName
FROM products
INNER JOIN productSeller ON products.idProduct = productSeller.idProduct
INNER JOIN seller ON productSeller.idSeller = seller.idSeller;

--
SELECT typePayment, SUM(limitAvailable) 
FROM payments
GROUP BY typePayment
HAVING SUM(limitAvailable) > 500;
