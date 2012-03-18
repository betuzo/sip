package org.valledelbit.sip



import org.junit.*
import grails.test.mixin.*

@TestFor(PagosPredioController)
@Mock(PagosPredio)
class PagosPredioControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/pagosPredio/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.pagosPredioInstanceList.size() == 0
        assert model.pagosPredioInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.pagosPredioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.pagosPredioInstance != null
        assert view == '/pagosPredio/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/pagosPredio/show/1'
        assert controller.flash.message != null
        assert PagosPredio.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/pagosPredio/list'


        populateValidParams(params)
        def pagosPredio = new PagosPredio(params)

        assert pagosPredio.save() != null

        params.id = pagosPredio.id

        def model = controller.show()

        assert model.pagosPredioInstance == pagosPredio
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/pagosPredio/list'


        populateValidParams(params)
        def pagosPredio = new PagosPredio(params)

        assert pagosPredio.save() != null

        params.id = pagosPredio.id

        def model = controller.edit()

        assert model.pagosPredioInstance == pagosPredio
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/pagosPredio/list'

        response.reset()


        populateValidParams(params)
        def pagosPredio = new PagosPredio(params)

        assert pagosPredio.save() != null

        // test invalid parameters in update
        params.id = pagosPredio.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/pagosPredio/edit"
        assert model.pagosPredioInstance != null

        pagosPredio.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/pagosPredio/show/$pagosPredio.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        pagosPredio.clearErrors()

        populateValidParams(params)
        params.id = pagosPredio.id
        params.version = -1
        controller.update()

        assert view == "/pagosPredio/edit"
        assert model.pagosPredioInstance != null
        assert model.pagosPredioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/pagosPredio/list'

        response.reset()

        populateValidParams(params)
        def pagosPredio = new PagosPredio(params)

        assert pagosPredio.save() != null
        assert PagosPredio.count() == 1

        params.id = pagosPredio.id

        controller.delete()

        assert PagosPredio.count() == 0
        assert PagosPredio.get(pagosPredio.id) == null
        assert response.redirectedUrl == '/pagosPredio/list'
    }
}
