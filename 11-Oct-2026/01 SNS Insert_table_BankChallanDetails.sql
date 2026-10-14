DECLARE @TempStandardDetails TABLE
( OldStandarddivId INT,
    NewStandarddivId INT);

INSERT INTO @TempStandardDetails
(   OldStandarddivId ,
    NewStandarddivId )
SELECT 
    OldVSD.SchoolWise_Standard_Division_Id,
    NewVSD.SchoolWise_Standard_Division_Id
FROM vw_standard_division OldVSD
INNER JOIN vw_standard_division NewVSD
    ON OldVSD.Original_Standard_Id = NewVSD.Original_Standard_Id
    AND OldVSD.Original_Division_Id = NewVSD.Original_Division_Id
WHERE OldVSD.Academic_Year_Id = 13
  AND NewVSD.Academic_Year_Id = 14;

   INSERT INTO BankChallanDetails
    (   AccountHeaderId,
        SchoolCurrentAccountNumber,
        StandardDivisionId,
        IsDeleted,
        SchoolId,
        OriginalFeeTypeId)
    SELECT
        BCD.AccountHeaderId,
        BCD.SchoolCurrentAccountNumber,
        TSD.NewStandarddivId,
        BCD.IsDeleted,
        BCD.SchoolId,
        BCD.OriginalFeeTypeId
    FROM BankChallanDetails BCD
    INNER JOIN @TempStandardDetails TSD
        ON BCD.StandardDivisionId = TSD.OldStandarddivId
    INNER JOIN vw_standard_division VSD
        ON BCD.StandardDivisionId = VSD.SchoolWise_Standard_Division_Id
    WHERE VSD.Academic_Year_Id = 13
      AND BCD.IsDeleted = 0
      AND NOT EXISTS
      (
          SELECT 1
          FROM BankChallanDetails BCDNew
          WHERE BCDNew.StandardDivisionId = TSD.NewStandarddivId
            AND BCDNew.AccountHeaderId = BCD.AccountHeaderId
            AND BCDNew.SchoolId = BCD.SchoolId
            AND BCDNew.OriginalFeeTypeId = BCD.OriginalFeeTypeId
      );






