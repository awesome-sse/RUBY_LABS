<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!--xsl:template говорит о том, что тут будет замена. match показывает, к какой части документа это применимо-->
    <xsl:template match="hash">
    <!--Внутри шаблона пишем наше преобразование-->

        <html>
            <head>
                <meta charset="utf-8"/>
                <title>Ответ</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
            </head>
            <body>
                <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">
                    <h4 class="my-0 mr-md-auto font-weight-normal">Шахов Станислав ИУ6-33Б</h4>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-5">

                            <xsl:choose>
                                <xsl:when test="not(error != '')">
                                    <xsl:choose>
                                        <xsl:when test="longests != ''">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">Отрезки</th>
                                                        <th scope="col">Индексы</th>
                                                    </tr>
                                                </thead>
                                            
                                                <tbody>
                                                    <!--Цикл-->
                                                    <xsl:for-each select="results/result">
                                                        <xsl:variable name="counter" select="position()"/>
                                                        <tr>
                                                            <th scope="row">
                                                                <xsl:value-of select="$counter"></xsl:value-of>
                                                            </th>
                                                            <td>
                                                                <xsl:value-of select="sub"></xsl:value-of>
                                                            </td>
                                                            <td>
                                                                <xsl:value-of select="idx"></xsl:value-of>
                                                            </td>

                                                        </tr>
                                                    </xsl:for-each>
                                                </tbody>

                                            </table>
                                            <p>
                                                <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Самый длинный отрезок</th>
                                                        <th scope="col">Индексы</th>
                                                    </tr>
                                                </thead>
                                            
                                                <tbody>
                                                    <!--Цикл-->
                                                    <xsl:for-each select="longests/longest">
                                                        <tr>
                                                            <td>
                                                                <xsl:value-of select="sub"></xsl:value-of>
                                                            </td>
                                                            <td>
                                                                <xsl:value-of select="idx"></xsl:value-of>
                                                            </td>

                                                        </tr>
                                                    </xsl:for-each>
                                                </tbody>

                                            </table>
                                            </p>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <p> Отрезков не нашлось... </p>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:when>
                                <xsl:otherwise>
                                    <p> <xsl:value-of select="error"></xsl:value-of> </p>
                                </xsl:otherwise>
                            </xsl:choose>
                        
                        </div>
                    </div>
                </div>
            </body>
        </html>

    </xsl:template>
</xsl:stylesheet>