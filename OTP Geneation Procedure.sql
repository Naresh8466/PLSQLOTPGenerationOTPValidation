CREATE OR REPLACE PROCEDURE otp_generation(p_phone IN NUMBER, p_otp OUT NUMBER) AS
BEGIN
    p_otp := TRUNC(DBMS_RANDOM.VALUE(100000, 999999));

    INSERT INTO otp_details(mobilenumber, otp, otpgeneratedtime, otpexpiredtime)
    VALUES (p_phone, p_otp, SYSDATE, SYSDATE + INTERVAL '1' DAY);

    COMMIT;
END otp_generation;
/
