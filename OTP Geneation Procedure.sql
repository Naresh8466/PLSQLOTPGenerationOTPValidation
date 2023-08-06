CREATE OR REPLACE PROCEDURE otp_generation(p_phone IN NUMBER, p_otp OUT NUMBER) AS
BEGIN
    p_otp := TRUNC(DBMS_RANDOM.VALUE(100000, 999999));

    INSERT INTO otp_details(mobilenumber, otp, otpgeneratedtime, otpexpiredtime)
    VALUES (p_phone, p_otp, SYSDATE, SYSDATE + INTERVAL '1' DAY);

    COMMIT;
END otp_generation;
/


-----Execute Procedure
--Using Anonymous Block
    
Declare
OTP number;
Begin
Otp_generation('9123456789',OTP);
Dbms_output.put_line(OTP);
end;
/

--OUTPUT :- 863565
/*
MOBILENUMBER        OTP OTPGENERATEDTIME     OTPEXPIREDTIME
------------ ---------- -------------------- --------------------
  8466907854     655708 06-AUG-23            06-AUG-23
  9123456789     863565 06-AUG-23            06-AUG-23  */
