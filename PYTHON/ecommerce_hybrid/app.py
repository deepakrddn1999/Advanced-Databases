import mysql.connector
from mysql.connector import Error
from pymongo import MongoClient
from pprint import pprint



MYSQL_HOST = "localhost"
MYSQL_USER = "root"
MYSQL_PASSWORD = "root"
MYSQL_DATABASE = "ecommerce_hybrid"


def connect_mysql():

    try:

        connection = mysql.connector.connect(
            host=MYSQL_HOST,
            user=MYSQL_USER,
            password=MYSQL_PASSWORD,
            database=MYSQL_DATABASE
        )

        if connection.is_connected():

            print("MySQL connected successfully.")

            return connection

    except Error as error:

        print("MySQL connection failed:")
        print(error)

    return None



MONGO_URI = "mongodb://localhost:27017/"
MONGO_DATABASE = "ecommerce_nosql"


def connect_mongodb():

    try:

        client = MongoClient(MONGO_URI)


        client.admin.command("ping")

        database = client[MONGO_DATABASE]

        print("MongoDB connected successfully.")

        return client, database

    except Exception as error:

        print("MongoDB connection failed:")
        print(error)

    return None, None



def mysql_create_customer(connection):

    cursor = connection.cursor()

    sql = """
        INSERT INTO customers
        (
            first_name,
            last_name,
            email,
            phone,
            registration_date,
            city,
            country
        )
        VALUES
        (
            %s,
            %s,
            %s,
            %s,
            CURDATE(),
            %s,
            %s
        )
    """

    values = (
        "Python",
        "Customer",
        "python.crud@example.com",
        "+491234567890",
        "Berlin",
        "Germany"
    )

    try:

        cursor.execute(sql, values)

        connection.commit()

        customer_id = cursor.lastrowid

        print("\n===================================")
        print("MYSQL - CREATE")
        print("===================================")

        print("Customer created successfully.")
        print("Customer ID:", customer_id)

        return customer_id

    except Error as error:

        connection.rollback()

        print("MySQL CREATE error:")
        print(error)

        return None

    finally:

        cursor.close()


def mysql_read_customer(connection, customer_id):

    cursor = connection.cursor(dictionary=True)

    sql = """
        SELECT
            customer_id,
            first_name,
            last_name,
            email,
            phone,
            registration_date,
            city,
            country
        FROM customers
        WHERE customer_id = %s
    """

    try:

        cursor.execute(
            sql,
            (customer_id,)
        )

        customer = cursor.fetchone()

        print("\n===================================")
        print("MYSQL - READ")
        print("===================================")

        if customer:

            pprint(customer)

        else:

            print("Customer not found.")

        return customer

    except Error as error:

        print("MySQL READ error:")
        print(error)

        return None

    finally:

        cursor.close()




def mysql_update_customer(connection, customer_id):

    cursor = connection.cursor()

    sql = """
        UPDATE customers

        SET
            city = %s,
            phone = %s

        WHERE customer_id = %s
    """

    values = (
        "Munich",
        "+49876543210",
        customer_id
    )

    try:

        cursor.execute(
            sql,
            values
        )

        connection.commit()

        print("\n===================================")
        print("MYSQL - UPDATE")
        print("===================================")

        print(
            "Rows updated:",
            cursor.rowcount
        )

    except Error as error:

        connection.rollback()

        print("MySQL UPDATE error:")
        print(error)

    finally:

        cursor.close()



def mysql_delete_customer(connection, customer_id):

    cursor = connection.cursor()

    sql = """
        DELETE FROM customers
        WHERE customer_id = %s
    """

    try:

        cursor.execute(
            sql,
            (customer_id,)
        )

        connection.commit()

        print("\n===================================")
        print("MYSQL - DELETE")
        print("===================================")

        print(
            "Rows deleted:",
            cursor.rowcount
        )

    except Error as error:

        connection.rollback()

        print("MySQL DELETE error:")
        print(error)

    finally:

        cursor.close()


def mongodb_create_product(products_collection):

    # Delete previous test product if it exists
    products_collection.delete_one(
        {
            "product_id": 9999
        }
    )

    product = {

        "product_id": 9999,

        "name": "Python CRUD Test Product",

        "brand": "PythonBrand",

        "category_id": 1,

        "category": "Electronics",

        "price": 199.99,

        "stock": 50,

        "specifications": {

            "colour": "Black",

            "connectivity": "Wireless",

            "warranty": "2 years"

        },

        "tags": [

            "python",

            "crud",

            "electronics"

        ],

        "active": True

    }

    try:

        result = products_collection.insert_one(
            product
        )

        print("\n===================================")
        print("MONGODB - CREATE")
        print("===================================")

        print("Product created successfully.")

        print(
            "MongoDB Document ID:",
            result.inserted_id
        )

        return 9999

    except Exception as error:

        print("MongoDB CREATE error:")
        print(error)

        return None


def mongodb_read_product(
    products_collection,
    product_id
):

    try:

        product = products_collection.find_one(

            {
                "product_id": product_id
            },

            {
                "_id": 0
            }

        )

        print("\n===================================")
        print("MONGODB - READ")
        print("===================================")

        if product:

            pprint(product)

        else:

            print("Product not found.")

        return product

    except Exception as error:

        print("MongoDB READ error:")
        print(error)

        return None




def mongodb_update_product(
    products_collection,
    product_id
):

    try:

        result = products_collection.update_one(

            {
                "product_id": product_id
            },

            {
                "$set": {

                    "price": 179.99,

                    "stock": 40,

                    "specifications.colour": "Silver"

                }
            }

        )

        print("\n===================================")
        print("MONGODB - UPDATE")
        print("===================================")

        print(
            "Documents updated:",
            result.modified_count
        )

    except Exception as error:

        print("MongoDB UPDATE error:")
        print(error)


def mongodb_delete_product(
    products_collection,
    product_id
):

    try:

        result = products_collection.delete_one(

            {
                "product_id": product_id
            }

        )

        print("\n===================================")
        print("MONGODB - DELETE")
        print("===================================")

        print(
            "Documents deleted:",
            result.deleted_count
        )

    except Exception as error:

        print("MongoDB DELETE error:")
        print(error)




def hybrid_customer_product_lookup(
    connection,
    products_collection,
    customer_id
):

    cursor = connection.cursor(
        dictionary=True
    )

    sql = """

        SELECT

            c.customer_id,

            c.first_name,

            c.last_name,

            o.order_id,

            o.order_status,

            oi.product_id,

            oi.quantity,

            oi.unit_price

        FROM customers c

        INNER JOIN orders o

            ON c.customer_id = o.customer_id

        INNER JOIN order_items oi

            ON o.order_id = oi.order_id

        WHERE c.customer_id = %s

        ORDER BY o.order_date DESC

    """

    try:

        cursor.execute(
            sql,
            (customer_id,)
        )

        orders = cursor.fetchall()

        print("\n===================================")
        print("HYBRID MYSQL + MONGODB OPERATION")
        print("===================================")

        if not orders:

            print(
                "No orders found for this customer."
            )

            return

        for order in orders:

            product = products_collection.find_one(

                {
                    "product_id":
                    order["product_id"]
                },

                {
                    "_id": 0,

                    "product_id": 1,

                    "name": 1,

                    "brand": 1,

                    "category": 1,

                    "price": 1
                }

            )

            print("\n-----------------------------------")

            print(
                "Customer:",
                order["first_name"],
                order["last_name"]
            )

            print(
                "Customer ID:",
                order["customer_id"]
            )

            print(
                "Order ID:",
                order["order_id"]
            )

            print(
                "Order Status:",
                order["order_status"]
            )

            print(
                "Product ID:",
                order["product_id"]
            )

            print(
                "Quantity:",
                order["quantity"]
            )

            print(
                "Unit Price:",
                order["unit_price"]
            )

            if product:

                print(
                    "Product Name:",
                    product.get("name")
                )

                print(
                    "Brand:",
                    product.get("brand")
                )

                print(
                    "Category:",
                    product.get("category")
                )

                print(
                    "MongoDB Price:",
                    product.get("price")
                )

            else:

                print(
                    "Product not found in MongoDB."
                )

    except Error as error:

        print("Hybrid SQL error:")
        print(error)

    finally:

        cursor.close()


def mysql_sales_analysis(connection):

    cursor = connection.cursor(
        dictionary=True
    )

    sql = """

        SELECT

            order_status,

            COUNT(order_id)
            AS total_orders,

            ROUND(
                SUM(total_amount),
                2
            )
            AS total_sales,

            ROUND(
                AVG(total_amount),
                2
            )
            AS average_order_value

        FROM orders

        GROUP BY order_status

        ORDER BY total_sales DESC

    """

    try:

        cursor.execute(sql)

        results = cursor.fetchall()

        print("\n===================================")
        print("MYSQL SALES ANALYSIS")
        print("===================================")

        for row in results:

            pprint(row)

    except Error as error:

        print("MySQL analysis error:")
        print(error)

    finally:

        cursor.close()



def mongodb_rating_analysis(
    reviews_collection
):

    pipeline = [

        {
            "$group": {

                "_id": "$product_id",

                "average_rating": {

                    "$avg": "$rating"

                },

                "total_reviews": {

                    "$sum": 1

                }

            }

        },

        {
            "$sort": {

                "average_rating": -1

            }

        },

        {
            "$limit": 10

        }

    ]

    try:

        results = reviews_collection.aggregate(
            pipeline
        )

        print("\n===================================")
        print("MONGODB RATING ANALYSIS")
        print("===================================")

        for result in results:

            pprint(result)

    except Exception as error:

        print(
            "MongoDB analysis error:"
        )

        print(error)



def main():

    print("\n")
    print("==============================================")
    print("      E-COMMERCE HYBRID DATABASE SYSTEM")
    print("==============================================")


    mysql_connection = connect_mysql()

    if mysql_connection is None:

        print(
            "Stopping program because MySQL "
            "connection failed."
        )

        return

    mongo_client, mongo_database = connect_mongodb()

    if mongo_database is None:

        print(
            "Stopping program because MongoDB "
            "connection failed."
        )

        mysql_connection.close()

        return


    products_collection = (
        mongo_database["products"]
    )

    reviews_collection = (
        mongo_database["reviews"]
    )



    print("\n\n")
    print("##############################################")
    print("#              MYSQL CRUD                    #")
    print("##############################################")

    # CREATE

    customer_id = mysql_create_customer(
        mysql_connection
    )

    if customer_id is not None:

        # READ

        mysql_read_customer(
            mysql_connection,
            customer_id
        )

        # UPDATE

        mysql_update_customer(
            mysql_connection,
            customer_id
        )

        # READ UPDATED DATA

        mysql_read_customer(
            mysql_connection,
            customer_id
        )

    # ========================================================
    # MONGODB CRUD
    # ========================================================

    print("\n\n")
    print("##############################################")
    print("#             MONGODB CRUD                   #")
    print("##############################################")

    # CREATE

    product_id = mongodb_create_product(
        products_collection
    )

    if product_id is not None:

        # READ

        mongodb_read_product(
            products_collection,
            product_id
        )

        # UPDATE

        mongodb_update_product(
            products_collection,
            product_id
        )

        # READ UPDATED DATA

        mongodb_read_product(
            products_collection,
            product_id
        )

    # ========================================================
    # MYSQL BUSINESS QUERY
    # ========================================================

    mysql_sales_analysis(
        mysql_connection
    )

    # ========================================================
    # MONGODB BUSINESS QUERY
    # ========================================================

    mongodb_rating_analysis(
        reviews_collection
    )

    # ========================================================
    # HYBRID QUERY
    # ========================================================

    if customer_id is not None:

        hybrid_customer_product_lookup(

            mysql_connection,

            products_collection,

            customer_id

        )

    # ========================================================
    # DELETE MYSQL TEST CUSTOMER
    # ========================================================

    if customer_id is not None:

        mysql_delete_customer(

            mysql_connection,

            customer_id

        )

    # ========================================================
    # DELETE MONGODB TEST PRODUCT
    # ========================================================

    if product_id is not None:

        mongodb_delete_product(

            products_collection,

            product_id

        )

    # ========================================================
    # CLOSE MYSQL
    # ========================================================

    mysql_connection.close()

    print("\nMySQL connection closed.")

    # ========================================================
    # CLOSE MONGODB
    # ========================================================

    mongo_client.close()

    print("MongoDB connection closed.")

    print("\n")
    print("==============================================")
    print("       ALL CRUD OPERATIONS COMPLETED")
    print("==============================================")


# ============================================================
# PROGRAM START
# ============================================================

if __name__ == "__main__":

    main()