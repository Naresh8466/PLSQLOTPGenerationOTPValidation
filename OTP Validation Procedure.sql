CREATE OR REPLACE PROCEDURE otp_validation (
    p_phone IN NUMBER,
    p_otp IN NUMBER,
    p_message OUT VARCHAR2) 
AS
    L_count NUMBER;
BEGIN
    SELECT COUNT(1)
    INTO L_count
    FROM otp_details
    WHERE mobilenumber = p_phone
      AND otp = p_otp
      AND SYSDATE BETWEEN otpgeneratedtime AND otpexpiredtime;

    IF L_count = 1 THEN
        p_message := 'OTP applied successfully';
    ELSE
        p_message := 'OTP is invalid/expired';
    END IF;
END otp_validation;
/


---Execute Procedure :

Declare
Message Varchar2(200);
Begin
Otp_Validation(9123456789,863565,Message);
Dbms_output.put_line(OTP);
end;
/

---OUTPUT :- OTP is invalid/expired
