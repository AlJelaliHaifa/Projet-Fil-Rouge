DATA DICTIONARY

SUPPLIERS

Identifier (Integer) Name (Character string) City (Character string) Country (2 character) Address (Character string) Postal Code (Character string) Status (Character string) Representative (Character string) Telephone (Character string) Mail (Character string)

CUSTOMER

Identifier (Integer) Name (Character string) First name (Character string) Address (Character string) Postal code (Character string) City (Character string) Country (Char 2) Telephone (Character string) Mail (Character string) Category (Character string) Reference (Character string) Reduction coefficient (Decimal) Date of addition (Datetime) Date of modification (Datetime) Password (Character string) Commercial referent

EMPLOYEES

Identifier (Integer) Last name (String character) First name (String character) City(String character) CodePostal(String character) Function(String character) Salary(Decimal) Number of child(Integer) Date of entry(Date) Phone(String character) Mail(String character) Superior(Integer) Gender(Char)

PRODUCTS

Identifier (Integer) Category (Character string) Price (Decimal) Reference (Character string) Description (Character string) Short description (Character string) Description Long (Character string) Photo (Character string) Stock (Integer)

ORDER

Identifier (Integer) Reference (String character) Reduction (Decimal) order date (Date) payment date (Date) delivery address (String character) billing address (String character) order status(char 1)

ORDER DETAILS

Identifier (Integer) Quantity (Integer) VAT rate (Integer)

COUNTRY

Identifier (char 2) Name (String character)

PRODUCT CATEGORY

Identifier (Integer) Name (Character string) Parent category (Integer)

DELIVERY

Identifier Delivery(Integer) Address (String) Quantity of the product delivered (Integer) Date of shipment(Date) Date of delivery(Date)

