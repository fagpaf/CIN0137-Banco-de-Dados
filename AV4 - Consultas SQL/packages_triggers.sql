-- ============================================================================
-- ARQUIVO: plsql/04_packages_triggers.sql
-- ITENS DA CHECKLIST: CREATE OR REPLACE PACKAGE, PACKAGE BODY, 
-- TRIGGER (COMANDO), TRIGGER (LINHA).
-- ============================================================================

-- 1. [CREATE OR REPLACE PACKAGE]
CREATE OR REPLACE PACKAGE pkg_financeiro AS
    FUNCTION fn_get_preco_liquido (
        p_codigo_curso IN NUMBER,
        p_codigo_cupom IN VARCHAR2
    ) RETURN NUMBER;
END pkg_financeiro;
/

-- 2. [CREATE OR REPLACE PACKAGE BODY]
CREATE OR REPLACE PACKAGE BODY pkg_financeiro AS
    FUNCTION fn_get_preco_liquido (
        p_codigo_curso IN NUMBER,
        p_codigo_cupom IN VARCHAR2
    ) RETURN NUMBER IS
        v_preco NUMBER;
        v_desc  NUMBER := 0;
    BEGIN
        SELECT preco_base INTO v_preco FROM Curso WHERE codigo = p_codigo_curso;
        
        IF p_codigo_cupom IS NOT NULL THEN
            SELECT percentual_desconto INTO v_desc FROM Cupom WHERE codigo_cupom = p_codigo_cupom;
        END IF;
        
        RETURN ROUND(v_preco * (1 - (v_desc / 100)), 2);
    END fn_get_preco_liquido;
END pkg_financeiro;
/

-- 3. [CREATE OR REPLACE TRIGGER (COMANDO)]
CREATE OR REPLACE TRIGGER trg_auditoria_cupom
BEFORE INSERT OR UPDATE OR DELETE ON Cupom
BEGIN
    IF DELETING THEN
        DBMS_OUTPUT.PUT_LINE('[AUDITORIA COMANDO] Remoção de cupons identificada.');
    ELSIF INSERTING THEN
        DBMS_OUTPUT.PUT_LINE('[AUDITORIA COMANDO] Inserção de novos cupons no catálogo.');
    END IF;
END trg_auditoria_cupom;
/

-- 4. [CREATE OR REPLACE TRIGGER (LINHA)]
CREATE OR REPLACE TRIGGER trg_auto_status_duvida
BEFORE UPDATE ON Duvida
FOR EACH ROW
BEGIN
    IF :NEW.resposta IS NOT NULL AND :OLD.resposta IS NULL THEN
        :NEW.status := 'Respondida';
    END IF;
END trg_auto_status_duvida;
/