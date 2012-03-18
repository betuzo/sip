package org.valledelbit.sip



import org.junit.*
import grails.test.mixin.*

@TestFor(TipoPredioController)
@Mock(TipoPredio)
class TipoPredioControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tipoPredio/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tipoPredioInstanceList.size() == 0
        assert model.tipoPredioInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.tipoPredioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tipoPredioInstance != null
        assert view == '/tipoPredio/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tipoPredio/show/1'
        assert controller.flash.message != null
        assert TipoPredio.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoPredio/list'


        populateValidParams(params)
        def tipoPredio = new TipoPredio(params)

        assert tipoPredio.save() != null

        params.id = tipoPredio.id

        def model = controller.show()

        assert model.tipoPredioInstance == tipoPredio
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoPredio/list'


        populateValidParams(params)
        def tipoPredio = new TipoPredio(params)

        assert tipoPredio.save() != null

        params.id = tipoPredio.id

        def model = controller.edit()

        assert model.tipoPredioInstance == tipoPredio
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoPredio/list'

        response.reset()


        populateValidParams(params)
        def tipoPredio = new TipoPredio(params)

        assert tipoPredio.save() != null

        // test invalid parameters in update
        params.id = tipoPredio.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tipoPredio/edit"
        assert model.tipoPredioInstance != null

        tipoPredio.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tipoPredio/show/$tipoPredio.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tipoPredio.clearErrors()

        populateValidParams(params)
        params.id = tipoPredio.id
        params.version = -1
        controller.update()

        assert view == "/tipoPredio/edit"
        assert model.tipoPredioInstance != null
        assert model.tipoPredioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tipoPredio/list'

        response.reset()

        populateValidParams(params)
        def tipoPredio = new TipoPredio(params)

        assert tipoPredio.save() != null
        assert TipoPredio.count() == 1

        params.id = tipoPredio.id

        controller.delete()

        assert TipoPredio.count() == 0
        assert TipoPredio.get(tipoPredio.id) == null
        assert response.redirectedUrl == '/tipoPredio/list'
    }
}
