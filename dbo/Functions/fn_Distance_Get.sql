CREATE FUNCTION dbo.fn_Distance_Get
(   
    @La1 float , @Lo1 float , @La2 float, @Lo2 float
)
RETURNS FLOAT
AS
BEGIN
RETURN
    GEOGRAPHY::Point(@La1, @Lo1, 4326).STDistance(GEOGRAPHY::Point(@La2, @Lo2, 4326))/1000
END