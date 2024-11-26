from flask import Flask, render_template, request, redirect, url_for, flash
import mysql.connector

app = Flask(__name__)
app.secret_key = "sua_chave_secreta"

# Configuração do banco de dados
db_config = {
    "host": "localhost",
    "user": "root",
    "password": "senhabanco",
    "database": "LanchoneteVegana"
}

# Função para conectar ao banco de dados
def get_db_connection():
    return mysql.connector.connect(**db_config)

# Página inicial
@app.route('/')
def index():
    return render_template('base.html')

# ------------------------- Clientes -------------------------
@app.route('/clientes', methods=['GET', 'POST'])
def clientes():
    if request.method == 'POST':
        nome = request.form['nome']
        email = request.form['email']
        telefone = request.form['telefone']
        endereco = request.form['endereco']

        try:
            conn = get_db_connection()
            cursor = conn.cursor()
            query = "INSERT INTO Clientes (nome, email, telefone, endereco) VALUES (%s, %s, %s, %s)"
            cursor.execute(query, (nome, email, telefone, endereco))
            conn.commit()
            flash("Cliente cadastrado com sucesso!", "success")
        except mysql.connector.Error as err:
            flash(f"Erro ao cadastrar cliente: {err}", "danger")
        finally:
            cursor.close()
            conn.close()
        return redirect(url_for('clientes'))

    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM Clientes")
        clientes = cursor.fetchall()
    except mysql.connector.Error as err:
        clientes = []
        flash(f"Erro ao acessar clientes: {err}", "danger")
    finally:
        cursor.close()
        conn.close()

    return render_template('clientes.html', clientes=clientes)

# ------------------------- Produtos -------------------------
@app.route('/produtos', methods=['GET', 'POST'])
def produtos():
    if request.method == 'POST':
        nome = request.form['nome']
        descricao = request.form['descricao']
        preco = request.form['preco']
        categoria_id = request.form.get('categoria_id')
        disponibilidade = request.form.get('disponibilidade') == 'on'

        try:
            conn = get_db_connection()
            cursor = conn.cursor()
            query = """
                INSERT INTO Produtos (nome, descricao, preco, disponibilidade, categoria_id)
                VALUES (%s, %s, %s, %s, %s)
            """
            cursor.execute(query, (nome, descricao, preco, disponibilidade, categoria_id))
            conn.commit()
            flash("Produto cadastrado com sucesso!", "success")
        except mysql.connector.Error as err:
            flash(f"Erro ao cadastrar produto: {err}", "danger")
        finally:
            cursor.close()
            conn.close()
        return redirect(url_for('produtos'))

    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT p.*, c.nome_categoria FROM Produtos p LEFT JOIN Categorias c ON p.categoria_id = c.id_categoria")
        produtos = cursor.fetchall()
        cursor.execute("SELECT id_categoria, nome_categoria FROM Categorias")
        categorias = cursor.fetchall()
    except mysql.connector.Error as err:
        produtos = []
        categorias = []
        flash(f"Erro ao acessar produtos: {err}", "danger")
    finally:
        cursor.close()
        conn.close()

    return render_template('produtos.html', produtos=produtos, categorias=categorias)

# ------------------------- Categorias -------------------------
@app.route('/categorias', methods=['GET', 'POST'])
def categorias():
    if request.method == 'POST':
        nome_categoria = request.form['nome_categoria']

        try:
            conn = get_db_connection()
            cursor = conn.cursor()
            query = "INSERT INTO Categorias (nome_categoria) VALUES (%s)"
            cursor.execute(query, (nome_categoria,))
            conn.commit()
            flash("Categoria cadastrada com sucesso!", "success")
        except mysql.connector.Error as err:
            flash(f"Erro ao cadastrar categoria: {err}", "danger")
        finally:
            cursor.close()
            conn.close()
        return redirect(url_for('categorias'))

    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM Categorias")
        categorias = cursor.fetchall()
    except mysql.connector.Error as err:
        categorias = []
        flash(f"Erro ao acessar categorias: {err}", "danger")
    finally:
        cursor.close()
        conn.close()

    return render_template('categorias.html', categorias=categorias)

# ------------------------- Ingredientes -------------------------
@app.route('/ingredientes', methods=['GET', 'POST'])
def ingredientes():
    if request.method == 'POST':
        nome = request.form['nome']
        quantidade_em_estoque = request.form['quantidade_em_estoque']
        unidade = request.form['unidade']

        try:
            conn = get_db_connection()
            cursor = conn.cursor()
            query = """
                INSERT INTO Ingredientes (nome, quantidade_em_estoque, unidade)
                VALUES (%s, %s, %s)
            """
            cursor.execute(query, (nome, quantidade_em_estoque, unidade))
            conn.commit()
            flash("Ingrediente cadastrado com sucesso!", "success")
        except mysql.connector.Error as err:
            flash(f"Erro ao cadastrar ingrediente: {err}", "danger")
        finally:
            cursor.close()
            conn.close()
        return redirect(url_for('ingredientes'))

    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM Ingredientes")
        ingredientes = cursor.fetchall()
    except mysql.connector.Error as err:
        ingredientes = []
        flash(f"Erro ao acessar ingredientes: {err}", "danger")
    finally:
        cursor.close()
        conn.close()

    return render_template('ingredientes.html', ingredientes=ingredientes)

# ------------------------- Funcionários -------------------------
@app.route('/funcionarios', methods=['GET', 'POST'])
def funcionarios():
    if request.method == 'POST':
        nome = request.form['nome']
        cargo = request.form['cargo']
        salario = request.form['salario']
        data_admissao = request.form['data_admissao']

        try:
            conn = get_db_connection()
            cursor = conn.cursor()
            query = """
                INSERT INTO Funcionarios (nome, cargo, salario, data_admissao)
                VALUES (%s, %s, %s, %s)
            """
            cursor.execute(query, (nome, cargo, salario, data_admissao))
            conn.commit()
            flash("Funcionário cadastrado com sucesso!", "success")
        except mysql.connector.Error as err:
            flash(f"Erro ao cadastrar funcionário: {err}", "danger")
        finally:
            cursor.close()
            conn.close()
        return redirect(url_for('funcionarios'))

    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM Funcionarios")
        funcionarios = cursor.fetchall()
    except mysql.connector.Error as err:
        funcionarios = []
        flash(f"Erro ao acessar funcionários: {err}", "danger")
    finally:
        cursor.close()
        conn.close()

    return render_template('funcionarios.html', funcionarios=funcionarios)

# ------------------------- estoque -------------------------



# ------------------------- pedidos -------------------------



# ------------------------- pedidos_produtos -------------------------



# ------------------------- produtos -------------------------




# --------------------------------------------------------------
if __name__ == '__main__':
    app.run(debug=True)
