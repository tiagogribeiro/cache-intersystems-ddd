Class br.erp.domain.cliente.ClienteCNPJ extends br.erp.domain.shared.ValueObject [ Final ]
{

    Property cnpj As %String [ Private ];

    ClassMethod create(cnpj As %String) As Cnpj
    {
        return ..%New(cnpj)
    }

    Method %OnNew(cnpj As %String) As %Status [ Private ]
    {
        set ..cnpj = cnpj
        return $$$OK
    }

    Method isValid() As %Boolean
    {
        return ..cnpj?2N"."3N"."3N"/"4N"-"2N
    }
    

}