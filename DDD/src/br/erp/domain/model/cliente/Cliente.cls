Class br.erp.domain.model.cliente.Cliente extends br.erp.domain.shared.Entity [ Final ]
{
    Property UID As ClienteUID [ Private ];

    Property CNPJ As ClienteCNPJ [ Private ];

    Property empresa As ClienteEmpresa [ Private ];

    ClassMethod create(uid As ClienteUID, cnpj As ClienteCNPJ, empresa As ClienteEmpresa) As Cliente
    {
        return ..%New(uid, cnpj, empresa)
    }

    Method %OnNew(uid as ClienteUID, cnpj As ClienteCNPJ, empresa As ClienteEmpresa) As %Status [ Private ]
    {
        set ..empresa = empresa
        set ..uid = uid
        set ..cnpj = cnpj

        return $$$OK
    }

    Method isEmpty() As %Boolean
    {
        return ..UID.isEmpty()
    }

    Method isValid() AS %Boolean
    {
        return ..CNPJ.isValid()
    }


}