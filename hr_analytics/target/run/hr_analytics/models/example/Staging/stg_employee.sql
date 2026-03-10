
  create view `hr_analytics`.`stg_employee__dbt_tmp`
    
    
  as (
    WITH source AS (

    SELECT *
    FROM `hr_analytics`.`employee_raw`

)

SELECT
    EmployeeID AS employee_id,
    Age AS age,

    CASE
        WHEN LOWER(Attrition) = 'yes' THEN 1
        WHEN LOWER(Attrition) = 'no' THEN 0
        ELSE NULL
    END AS attrition,

    -- Proper case Gender
    CONCAT(
        UPPER(LEFT(Gender, 1)),
        LOWER(SUBSTRING(Gender, 2))
    ) AS gender,

    -- Format Hire Date as YYYY/MM/DD
    DATE_FORMAT(HireDate, '%Y/%m/%d') AS hire_date,

    YearsAtCompany AS years_at_company,
    YearsWithCurrManager AS years_with_manager,
    YearsSinceLastPromotion AS years_since_last_promotion,
    StockOptionLevel AS stock_option_level,

    -- Proper case Marital Status
    CONCAT(
        UPPER(LEFT(MaritalStatus, 1)),
        LOWER(SUBSTRING(MaritalStatus, 2))
    ) AS marital_status,

    -- Proper case Job Role
    CONCAT(
        UPPER(LEFT(JobRole, 1)),
        LOWER(SUBSTRING(JobRole, 2))
    ) AS job_role,

    -- Proper case Education Field
    CONCAT(
        UPPER(LEFT(EducationField, 1)),
        LOWER(SUBSTRING(EducationField, 2))
    ) AS education_field,

    Ethnicity AS ethnicity,

    -- State fully uppercase
    UPPER(State) AS state,

    `DistanceFromHome (KM)` AS distance_from_home_km,
    Department AS department,
    BusinessTravel AS business_travel,

    -- Converting Overtime 
    CASE
        WHEN LOWER(Overtime) = 'yes' THEN 1
        WHEN LOWER(Overtime) = 'no' THEN 0
        ELSE NULL
    END AS overtime

FROM source
  );